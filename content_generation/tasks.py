from celery import shared_task
from django.utils import timezone
import logging

logger = logging.getLogger(__name__)

@shared_task(bind=True, max_retries=3)
def process_generation_job(self, job_id):
    """Process a content generation job asynchronously"""
    try:
        from .models import ContentGenerationJob
        from .services import GenerationManager
        
        logger.info(f"Starting processing for job {job_id}")
        
        job = ContentGenerationJob.objects.get(id=job_id)
        manager = GenerationManager()
        manager.process_generation_job(job_id)
        
        logger.info(f"Completed processing for job {job_id}")
        
    except Exception as exc:
        logger.error(f"Error processing generation job {job_id}: {str(exc)}")
        # Retry with exponential backoff
        self.retry(exc=exc, countdown=60 * (2 ** self.request.retries))

@shared_task
def test_celery_connection():
    """Test task to verify Celery is working"""
    logger.info("Celery is working correctly!")
    return "Celery test successful!"

@shared_task
def add(x, y):
    """Simple test task that adds two numbers"""
    return x + y