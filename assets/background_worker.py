# assets/background_worker.py
import signal
import sys
import logging
import os
import django
import time
from django.db import connections

logger = logging.getLogger(__name__)

class BackgroundWorker:
    def __init__(self, name="worker"):
        self.name = name
        self.running = True
        self._setup_signal_handlers()
        
    def _setup_signal_handlers(self):
        """Set up handlers for various signals"""
        signal.signal(signal.SIGTERM, self._handle_exit_signal)
        signal.signal(signal.SIGINT, self._handle_exit_signal)
        signal.signal(signal.SIGUSR1, self._handle_exit_signal)
        
    def _handle_exit_signal(self, signum, frame):
        """Handle termination signals"""
        signal_names = {
            signal.SIGTERM: "SIGTERM",
            signal.SIGINT: "SIGINT",
            signal.SIGUSR1: "SIGUSR1"
        }
        signal_name = signal_names.get(signum, f"signal {signum}")
        
        logger.info(f"{self.name} received {signal_name}, shutting down...")
        self.running = False
        self.cleanup()
        sys.exit(0)
        
    def cleanup(self):
        """Perform any necessary cleanup"""
        logger.info(f"Cleaning up resources for {self.name}...")
        # Close file handles, DB connections, etc.
        for conn in connections.all():
            conn.close()
            
    def setup_django(self):
        """Setup Django if running standalone"""
        if not os.environ.get('DJANGO_SETTINGS_MODULE'):
            os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
            django.setup()
            
    def run(self):
        """Main execution method - override this in subclasses"""
        raise NotImplementedError("Subclasses must implement run()")

class AssetProcessingWorker(BackgroundWorker):
    def __init__(self):
        super().__init__(name="AssetProcessor")
        self.setup_django()
        
    def run(self):
        """Process asset jobs from the database"""
        # Fix the import to use absolute path
        from assets.models import AssetProcessingJob, Asset
        from django.utils import timezone
        from assets.utils import process_text_file, process_pdf_file, determine_process_function
        import os
        from django.conf import settings
        
        logger.info("Starting asset processing worker...")
        
        while self.running:
            try:
                # Get jobs that need processing
                jobs = AssetProcessingJob.objects.filter(
                    status__in=['created', 'failed'],
                    attempts__lt=3  # Don't process jobs that have failed too many times
                ).select_related('asset', 'project')[:10]  # Process in small batches
                
                if not jobs:
                    # No jobs to process, sleep and check again
                    logger.debug("No jobs to process, sleeping...")
                    time.sleep(5)
                    continue
                
                for job in jobs:
                    try:
                        # Mark job as in progress
                        job.status = 'in_progress'
                        job.last_heart_beat = timezone.now()
                        job.save(update_fields=['status', 'last_heart_beat'])
                        
                        # Get the asset and file path
                        asset = job.asset
                        file_path = os.path.join(settings.MEDIA_ROOT, asset.file_name)
                        
                        # Process the file based on type
                        process_func = determine_process_function(asset.file_type, asset.mime_type)
                        content, token_count = process_func(file_path)
                        
                        # Update asset with content and token count
                        asset.content = content
                        asset.token_count = token_count
                        asset.save(update_fields=['content', 'token_count'])
                        
                        # Mark job as completed
                        job.status = 'completed'
                        job.last_heart_beat = timezone.now()
                        job.save(update_fields=['status', 'last_heart_beat'])
                        
                        logger.info(f"Processed asset {asset.id}: {token_count} tokens")
                        
                    except Exception as e:
                        logger.error(f"Error processing job {job.id}: {e}")
                        job.status = 'failed'
                        job.error_message = str(e)[:500]  # Truncate long error messages
                        job.attempts += 1
                        job.save(update_fields=['status', 'error_message', 'attempts'])
                
            except Exception as e:
                logger.error(f"Error in job processing loop: {e}")
                
            # Small delay between processing batches
            time.sleep(1)
            