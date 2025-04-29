# assets/management/commands/process_asset_jobs.py
from django.core.management.base import BaseCommand
from assets.background_worker import AssetProcessingWorker
import multiprocessing

class Command(BaseCommand):
    help = 'Process asset jobs in the background'

    def add_arguments(self, parser):
        parser.add_argument(
            '--daemon',
            action='store_true',
            help='Run as a daemon process',
        )

    def handle(self, *args, **options):
        worker = AssetProcessingWorker()
        if options.get('daemon'):
            # Start process and return a string message instead of the process object
            process = multiprocessing.Process(target=worker.run)
            process.start()
            self.stdout.write(f"Started worker process with PID {process.pid}")
        else:
            # Run in the foreground
            self.stdout.write("Starting asset processing worker...")
            worker.run()
            