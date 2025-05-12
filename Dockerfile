FROM python:3.10-slim
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  netcat-openbsd \
  && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn psycopg2

# Copy application code
COPY . .

# (Optional) Collect static files for Django:
# RUN python manage.py collectstatic --noinput

EXPOSE 8000

# Default command
CMD ["gunicorn", "ai_marketing.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "4"]
