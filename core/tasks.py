# core/tasks.py
from celery import shared_task
from django.utils import timezone
from django.contrib.auth import get_user_model
import logging

logger = logging.getLogger(__name__)

@shared_task
def reset_monthly_token_usage():
    """Reset token usage for all users on subscription renewal"""
    User = get_user_model()
    today = timezone.now().date()
    
    # Find users whose subscription renewed today
    users_to_reset = User.objects.filter(
        stripe_subscription__start_date__day=today.day
    )
    
    reset_count = 0
    for user in users_to_reset:
        try:
            from prompts.utils.token_tracker import reset_token_usage
            reset_token_usage(user)
            reset_count += 1
            logger.info(f"Reset token usage for user {user.username}")
        except Exception as e:
            logger.error(f"Failed to reset tokens for user {user.username}: {str(e)}")
    
    return f"Reset token usage for {reset_count} users"

@shared_task
def cleanup_old_generation_jobs():
    """Clean up old generation jobs to prevent database bloat"""
    from content_generation.models import ContentGenerationJob
    from datetime import timedelta
    
    # Delete jobs older than 30 days
    cutoff_date = timezone.now() - timedelta(days=30)
    deleted_count = ContentGenerationJob.objects.filter(
        created_at__lt=cutoff_date
    ).delete()[0]
    
    return f"Deleted {deleted_count} old generation jobs"
