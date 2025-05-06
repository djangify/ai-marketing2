import os
from celery import Celery
from celery.schedules import crontab
from django.conf import settings
import django

# Set the default Django settings module for the 'celery' program.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ai_marketing.settings')

# Setup Django
django.setup()

app = Celery('ai_marketing')

# Using a string here means the worker doesn't have to serialize
# the configuration object to child processes.
app.config_from_object('django.conf:settings', namespace='CELERY')

# Load task modules from all registered Django apps.
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)

@app.task(bind=True)
def debug_task(self):
    print(f'Request: {self.request!r}')

app.conf.beat_schedule = {
    'check-trial-reminders': {
        'task': 'subscriptions.tasks.check_and_send_trial_reminders',
        'schedule': crontab(hour=9, minute=0),  # Run daily at 9 AM
    },
    'reset-monthly-tokens': {
        'task': 'core.tasks.reset_monthly_token_usage',
        'schedule': crontab(hour=0, minute=0),  # Run daily at midnight
    },
    'cleanup-old-jobs': {
        'task': 'core.tasks.cleanup_old_generation_jobs',
        'schedule': crontab(hour=2, minute=0, day_of_week=0),  # Run weekly on Sunday at 2 AM
    },
}