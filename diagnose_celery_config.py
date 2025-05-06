# diagnose_celery_config.py
import os
import sys
import django

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ai_marketing.settings')
django.setup()

print("=== Celery Configuration Diagnostic ===")
print()

# Check environment variables
print("1. Environment variables:")
for key in ['CELERY_BROKER_URL', 'CELERY_RESULT_BACKEND', 'REDIS_URL', 'UPSTASH_REDIS_REST_URL']:
    print(f"   {key}: {os.environ.get(key, 'NOT SET')}")
print()

# Check Django settings
from django.conf import settings
print("2. Django settings:")
print(f"   CELERY_BROKER_URL: {getattr(settings, 'CELERY_BROKER_URL', 'NOT SET')}")
print(f"   CELERY_RESULT_BACKEND: {getattr(settings, 'CELERY_RESULT_BACKEND', 'NOT SET')}")
print()

# Import Celery app
from ai_marketing.celery import app
print("3. Celery app configuration (initial):")
print(f"   broker_url: {app.conf.broker_url}")
print(f"   result_backend: {app.conf.result_backend}")
print()

# Trigger the lazy loading of configuration
print("4. Triggering configuration load...")
try:
    backend = app.backend
    print(f"   Backend type: {type(backend)}")
    print(f"   Backend URL: {app.conf.result_backend}")
except Exception as e:
    print(f"   Error: {e}")
print()

# Check for .env file
print("5. Checking for .env file:")
import glob
env_files = glob.glob('.env*')
if env_files:
    for env_file in env_files:
        print(f"   Found: {env_file}")
        try:
            with open(env_file, 'r') as f:
                content = f.read()
                if 'redis' in content.lower() or 'upstash' in content.lower():
                    print("   Contains Redis/Upstash configuration!")
        except:
            pass
else:
    print("   No .env files found")