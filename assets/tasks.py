from celery import shared_task
import logging

logger = logging.getLogger(__name__)

@shared_task(bind=True, max_retries=3)
def process_asset_file(self, asset_id):
    """Process an uploaded asset file"""
    try:
        from .models import Asset
        from .utils import extract_text_from_file
        
        asset = Asset.objects.get(id=asset_id)
        # Add your file processing logic here
        
    except Exception as exc:
        logger.error(f"Error processing asset {asset_id}: {str(exc)}")
        self.retry(exc=exc, countdown=60 * (2 ** self.request.retries))