# subscriptions/tasks.py (updated)
from celery import shared_task
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings
from django.utils import timezone
from datetime import timedelta
import logging

logger = logging.getLogger(__name__)

@shared_task(
    bind=True,
    max_retries=3,
    default_retry_delay=300,  # 5 minutes
)
def send_subscription_email(self, email_type, user_id, **kwargs):
    """Send subscription-related emails"""
    try:
        from django.contrib.auth import get_user_model
        User = get_user_model()
        user = User.objects.get(id=user_id)
        
        # Email templates mapping
        email_templates = {
            'welcome': {
                'subject': 'Welcome to AI Marketing Platform!',
                'template': 'subscriptions/emails/welcome.html'
            },
            'trial_welcome': {  # Added existing trial welcome
                'subject': 'Welcome to Your AI Marketing Platform Trial!',
                'template': 'subscriptions/emails/trial_welcome.html'
            },
            'trial_ending': {  # Updated to match existing
                'subject': 'Your AI Marketing Platform Trial is Ending Soon',
                'template': 'subscriptions/emails/trial_reminder.html'
            },
            'trial_ended': {  # Added existing trial ended
                'subject': 'Your AI Marketing Platform Trial Has Ended',
                'template': 'subscriptions/emails/trial_ended.html'
            },
            'renewal_success': {
                'subject': 'Your subscription has been renewed',
                'template': 'subscriptions/emails/renewal_success.html'
            },
            'payment_failed': {
                'subject': 'Payment failed - Action required',
                'template': 'subscriptions/emails/payment_failed.html'
            },
            'subscription_cancelled': {
                'subject': 'Your subscription has been cancelled',
                'template': 'subscriptions/emails/subscription_cancelled.html'
            },
        }
        
        if email_type not in email_templates:
            raise ValueError(f"Unknown email type: {email_type}")
        
        template_info = email_templates[email_type]
        
        # Prepare context
        context = {
            'user': user,
            'subscription': getattr(user, 'stripe_subscription', None),
            'trial_end_date': user.subscription_profile.get_trial_end_date() if hasattr(user, 'subscription_profile') else None,
            'site_url': settings.SITE_URL,
            **kwargs
        }
        
        # Render email content
        html_content = render_to_string(template_info['template'], context)
        
        # Send email
        send_mail(
            subject=template_info['subject'],
            message='',  # Plain text version (required but we use HTML)
            from_email=settings.DEFAULT_FROM_EMAIL,
            recipient_list=[user.email],
            html_message=html_content,
            fail_silently=False,
        )
        
        logger.info(f"Sent {email_type} email to {user.email}")
        return f"Email sent successfully to {user.email}"
        
    except Exception as e:
        logger.error(f"Error sending {email_type} email: {str(e)}")
        self.retry(exc=e)

@shared_task
def send_trial_ending_reminder(user_id, days_remaining):
    """Send trial ending reminder email"""
    try:
        from django.contrib.auth import get_user_model
        User = get_user_model()
        user = User.objects.get(id=user_id)
        
        # Send trial ending email
        send_subscription_email.delay(
            'trial_ending',
            user.id,
            days_remaining=days_remaining,
            trial_end_date=user.subscription_profile.get_trial_end_date()
        )
        
        # Mark as notified based on days remaining
        if days_remaining == 3:
            user.subscription_profile.trial_reminder_3_days_sent = True
        elif days_remaining == 1:
            user.subscription_profile.trial_reminder_1_day_sent = True
        
        user.subscription_profile.save()
        
        return f"Sent {days_remaining}-day trial reminder to {user.email}"
    except Exception as e:
        logger.error(f"Error sending trial reminder: {str(e)}")
        raise

@shared_task
def send_trial_ended_notification(user_id):
    """Send trial ended notification email"""
    try:
        send_subscription_email.delay('trial_ended', user_id)
        return f"Sent trial ended notification to user {user_id}"
    except Exception as e:
        logger.error(f"Error sending trial ended notification: {str(e)}")
        raise

@shared_task
def check_and_send_trial_reminders():
    """Check for trials ending soon and send appropriate reminders"""
    from django.contrib.auth import get_user_model
    from subscriptions.models import UserProfile
    from datetime import timedelta
    
    User = get_user_model()
    today = timezone.now().date()
    
    # We need to handle this differently since trial_end_date is calculated
    # Get all users with profiles
    users_with_profiles = User.objects.filter(subscription_profile__isnull=False)
    
    # Check each user's trial end date
    users_3_days = []
    users_1_day = []
    users_ended_today = []
    
    for user in users_with_profiles:
        profile = user.subscription_profile
        trial_end_date = profile.get_trial_end_date().date()
        
        # Check for trials ending in 3 days
        if trial_end_date == today + timedelta(days=3):
            if not hasattr(profile, 'trial_reminder_3_days_sent') or not profile.trial_reminder_3_days_sent:
                users_3_days.append(user)
        
        # Check for trials ending in 1 day
        elif trial_end_date == today + timedelta(days=1):
            if not hasattr(profile, 'trial_reminder_1_day_sent') or not profile.trial_reminder_1_day_sent:
                users_1_day.append(user)
        
        # Check for trials that ended today
        elif trial_end_date == today:
            if not hasattr(profile, 'trial_ended_email_sent') or not profile.trial_ended_email_sent:
                users_ended_today.append(user)
    
    # Send reminders for users with trials ending in 3 days
    for user in users_3_days:
        send_trial_ending_reminder.delay(user.id, 3)
    
    # Send reminders for users with trials ending in 1 day
    for user in users_1_day:
        send_trial_ending_reminder.delay(user.id, 1)
    
    # Send trial ended notifications
    for user in users_ended_today:
        send_trial_ended_notification.delay(user.id)
        user.subscription_profile.trial_ended_email_sent = True
        user.subscription_profile.save()
    
    return f"Processed trial reminders: {len(users_3_days)} (3-day), {len(users_1_day)} (1-day), {len(users_ended_today)} (ended)"