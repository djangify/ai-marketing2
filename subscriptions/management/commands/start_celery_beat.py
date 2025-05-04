# management/commands/start_celery_beat.py
from django.core.management.base import BaseCommand
import subprocess
import os

class Command(BaseCommand):
    help = 'Starts Celery beat scheduler'

    def handle(self, *args, **options):
        self.stdout.write("Starting Celery beat scheduler...")
        
        # Set up the environment
        env = os.environ.copy()
        
        # Start Celery beat
        process = subprocess.Popen(
            ['celery', '-A', 'ai_marketing', 'beat', '-l', 'info', '--scheduler', 'django_celery_beat.schedulers:DatabaseScheduler'],
            env=env
        )
        
        try:
            process.wait()
        except KeyboardInterrupt:
            process.terminate()
            self.stdout.write(self.style.SUCCESS('Celery beat stopped'))