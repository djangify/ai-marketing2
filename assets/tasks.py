from celery import shared_task
import logging
from django.utils import timezone

logger = logging.getLogger(__name__)

@shared_task(bind=True, max_retries=3)
def process_asset_file(self, asset_id):
    """Process an uploaded asset file"""
    try:
        from assets.models import Asset, AssetProcessingJob
        from assets.utils import determine_process_function, sanitize_content, get_token_count
        from django.conf import settings
        import os
        
        logger.info(f"Starting processing for asset {asset_id}")
        
        asset = Asset.objects.get(id=asset_id)
        
        # Check if already processed
        if asset.content:
            logger.info(f"Asset {asset_id} already has content, skipping processing")
            return
        
        # Process the file
        file_path = os.path.join(settings.MEDIA_ROOT, asset.file_name)
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"File not found: {file_path}")
        
        # Determine the appropriate processing function
        process_func = determine_process_function(asset.file_type, asset.mime_type)
        
        # Process the file
        content, token_count = process_func(file_path)
        
        # Store original token count
        original_token_count = token_count
        
        # Sanitize content for database storage
        sanitized_content = sanitize_content(content) if content else ""
        
        # Update asset with processed content
        asset.content = sanitized_content
        asset.token_count = original_token_count
        asset.save()
        
        # Update processing job status
        try:
            job = AssetProcessingJob.objects.get(asset=asset)
            job.status = 'completed'
            job.save()
            logger.info(f"Completed processing for asset {asset_id}")
        except AssetProcessingJob.DoesNotExist:
            # Job might not exist for some assets
            logger.warning(f"No processing job found for asset {asset_id}")
        
    except Exception as exc:
        logger.error(f"Error processing asset {asset_id}: {str(exc)}")
        
        # Update job status to failed
        try:
            job = AssetProcessingJob.objects.get(asset_id=asset_id)
            job.status = 'failed'
            job.error_message = str(exc)
            job.attempts += 1
            job.save()
        except AssetProcessingJob.DoesNotExist:
            pass
        
        # Retry with exponential backoff
        self.retry(exc=exc, countdown=60 * (2 ** self.request.retries))

@shared_task(bind=True, max_retries=3)
def process_uploaded_file(self, processing_job_id):
    """Process an uploaded file through the processing job"""
    try:
        from assets.models import AssetProcessingJob
        from assets.utils import determine_process_function, sanitize_content
        from django.conf import settings
        import os
        
        logger.info(f"Starting processing job {processing_job_id}")
        
        job = AssetProcessingJob.objects.get(id=processing_job_id)
        asset = job.asset
        
        # Mark job as in progress
        job.status = 'in_progress'
        job.attempts += 1
        job.save()
        
        # Process the file
        file_path = os.path.join(settings.MEDIA_ROOT, asset.file_name)
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"File not found: {file_path}")
        
        # Determine the appropriate processing function
        process_func = determine_process_function(asset.file_type, asset.mime_type)
        
        # Process the file
        content, token_count = process_func(file_path)
        
        # Store original token count
        original_token_count = token_count
        
        # Sanitize content for database storage
        sanitized_content = sanitize_content(content) if content else ""
        
        # Update asset with processed content
        asset.content = sanitized_content
        asset.token_count = original_token_count
        asset.save()
        
        # Mark job as completed
        job.status = 'completed'
        job.save()
        
        logger.info(f"Completed processing job {processing_job_id}")
        
    except Exception as exc:
        logger.error(f"Error in processing job {processing_job_id}: {str(exc)}")
        
        # Update job status
        try:
            job = AssetProcessingJob.objects.get(id=processing_job_id)
            job.status = 'failed'
            job.error_message = str(exc)
            job.attempts += 1
            
            # If max attempts exceeded, mark as permanently failed
            if job.attempts >= self.max_retries:
                job.status = 'max_attempts_exceeded'
                logger.error(f"Processing job {processing_job_id} failed permanently after {job.attempts} attempts")
            
            job.save()
        except AssetProcessingJob.DoesNotExist:
            pass
        
        # Retry with exponential backoff if not at max retries
        if self.request.retries < self.max_retries:
            self.retry(exc=exc, countdown=60 * (2 ** self.request.retries))