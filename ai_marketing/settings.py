from pathlib import Path
import os
from django.urls import reverse_lazy
import environ
import pymysql 
import ssl
from urllib.parse import urlparse
from celery.schedules import crontab


pymysql.install_as_MySQLdb()
# Initialize environment variables
env = environ.Env()
environ.Env.read_env() 

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
SECRET_KEY = os.environ.get("SECRET_KEY")
DEBUG = True
ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'localhost:8000']
CSRF_TRUSTED_ORIGINS = [
    "http://localhost",
    "http://127.0.0.1",
    "http://localhost:8000",
]


# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'subscriptions.apps.SubscriptionsConfig',
# Third-party apps
    'widget_tweaks',
    'django_celery_results',
    'tinymce',
    
# Local apps
    'accounts',
    'projects',
    'content_templates',
    'prompts',
    'assets',
    'api',
    'blog',
    'core',
    'docs',
    'content_generation',
    'seo_optimization',
    'prompt_generator',
   
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    # 'ai_marketing.middleware.AuthRequiredMiddleware', 
]

# Authentication settings
# LOGIN_URL = '/accounts/login/'
# LOGIN_REDIRECT_URL = '/dashboard/'
# LOGOUT_REDIRECT_URL = '/accounts/login/'
ADMIN_URL = 'admin/'

# Constants for the application
MAX_TOKENS_ASSETS = 100000
MAX_TOKENS_PROMPT = 20000


ROOT_URLCONF = 'ai_marketing.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'subscriptions.context_processors.subscription_status',
            ],
        },
    },
]

WSGI_APPLICATION = 'ai_marketing.wsgi.application'


# Database
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": env("DATABASE_NAME"),
        "USER": env("DATABASE_USER"),
        "PASSWORD": env("DATABASE_PASSWORD"),
        "HOST": env("DATABASE_HOST", default="127.0.0.1"),
        "PORT": env("DATABASE_PORT", default="3306"),
        "CONN_MAX_AGE": 600,
        "OPTIONS": {
            "charset": "utf8mb4",
            "init_command": "SET sql_mode='STRICT_TRANS_TABLES'",
            "use_unicode": True,
            "connect_timeout": 10,
            "autocommit": True,
        },
    },
}

# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_TZ = True


# Media and Static files (CSS, JavaScript, Images)
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
STATIC_URL = '/static/'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
]


# Default primary key field type
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Stripe settings
STRIPE_PUBLISHABLE_KEY = env('STRIPE_PUBLISHABLE_KEY', default='pk_test_placeholder')
STRIPE_SECRET_KEY = env('STRIPE_SECRET_KEY', default='sk_test_placeholder')
STRIPE_WEBHOOK_SECRET = env('STRIPE_WEBHOOK_SECRET', default='whsec_placeholder')
STRIPE_PRICE_ID_MONTHLY = env('STRIPE_PRICE_ID_MONTHLY', default='price_1RHL24BSytWSX0dbjJFz6BQO')
STRIPE_PRICE_ID_QUARTERLY = env('STRIPE_PRICE_ID_QUARTERLY', default='price_1RHL4KBSytWSX0db7cIwLiDc')
STRIPE_PRICE_ID_YEARLY = env('STRIPE_PRICE_ID_YEARLY', default='price_1RHL63BSytWSX0dbfT6OzPq4')

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.TokenAuthentication',
    ],
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated',
    ],
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10,
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
    ],
}

# OpenAI API settings
OPENAI_API_KEY = os.environ.get('OPENAI_API_KEY')
OPENAI_DEFAULT_MODEL = 'gpt-4o'
OPENAI_FALLBACK_MODEL = 'gpt-3.5-turbo'

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake',
    }
}

REDIS_URL = env('REDIS_URL')

# 1) Point both broker and result backend at the same (rediss://) URL:
CELERY_BROKER_URL      = REDIS_URL
CELERY_RESULT_BACKEND  = REDIS_URL

# 2) Tell Celery to require real certs on *both* broker *and* backend:
CELERY_BROKER_USE_SSL         = {
    'ssl_cert_reqs': ssl.CERT_REQUIRED,
}
CELERY_REDIS_BACKEND_USE_SSL  = {
    'ssl_cert_reqs': ssl.CERT_REQUIRED,
}

# 3) The rest stays as you already have it:
CELERY_ACCEPT_CONTENT               = ['json']
CELERY_TASK_SERIALIZER              = 'json'
CELERY_RESULT_SERIALIZER            = 'json'
CELERY_TIMEZONE                     = 'UTC'
CELERY_BROKER_CONNECTION_RETRY_ON_STARTUP = True

SITE_URL = env(
    'SITE_URL',
    default='http://localhost:8000'
)