# AI Marketing Platform



## Overview

AI Marketing Platform is a comprehensive Django web application designed to streamline and automate content creation for marketing purposes. The platform leverages AI capabilities to transform raw assets (text, PDFs, etc.) into polished marketing content using customisable prompts and templates.

**Key Value Proposition:** Save hours of content creation time by feeding source materials into our AI system, which generates marketing content tailored to your specific needs and brand voice.

| Feature | Description |
|---------|-------------|
| Content Generation | Transform source materials into marketing content |
| Template System | Create reusable prompt collections |
| Prompt Engineering | Generate optimised prompts via preset templates |
| SEO Analysis | Analyze content for search engine performance |
| Token Management | Track usage across a subscription-based model |

## Table of Contents

- [Features](#features)
- [System Architecture](#system-architecture)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage Guide](#usage-guide)
- [API Documentation](#api-documentation)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Features

### Projects
Projects serve as containers for arranging your marketing initiatives. Each project contains:
- Source assets (uploaded files)
- Custom prompts
- Generated content

[View Projects Code](projects/models.py)

### Asset Management
Upload and process various file types to extract content for AI processing:
- Text files (.txt)
- Markdown (.md)
- PDFs
- Support for audio and video transcription via processing jobs

[View Assets Code](assets/models.py)

### Prompt Engineering
Create detailed instructions to guide the AI content generation:
- Custom prompts per project
- Token counting to manage API usage
- Prompt layering for improved results

[View Prompts Code](prompts/models.py)

### Content Generation
Transform your assets into marketing content using:
- OpenAI GPT models
- Template-based generation
- Language preference selection (US/UK English)
- Batch processing with job management

[View Content Generation Code](content_generation/services.py)

### Templates
Save collections of prompts for reuse across multiple projects:
- Clone templates to new projects
- Share templates between users
- Organize by category/purpose

[View Templates Code](content_templates/models.py)

### Prompt Generator
Create specialized prompts using guided templates:
- Category-organised prompt templates
- Fill-in-the-blank prompt creation
- Save and reuse generated prompts

[View Prompt Generator Code](prompt_generator/models.py)

### SEO Optimisation
Analyse generated content for search engine performance:
- Readability scoring
- Keyword density analysis
- Meta description generation
- Improvement suggestions

[View SEO Optimization Code](seo_optimization/models.py)

### Subscription Management
Token-based system for tracking usage limits:
- Stripe integration for payment processing
- Usage monitoring for assets and prompts
- Subscription payment options monthly, quarterly and yearly

[View Subscription Code](accounts/models.py)

## System Architecture

The AI Marketing Platform follows a modular Django architecture with the following key components:

### Backend
- **Django Web Framework**: Core application structure
- **MariaDB Database**: Data storage (optimised for cPanel hosting)
- **Celery**: Background task processing for asset handling and content generation
- **Redis**: Message broker for Celery tasks and caching

### Frontend
- **Tailwind CSS**: Responsive UI framework
- **HTMX**: Dynamic UI interactions without heavy JavaScript
- **JavaScript**: Enhanced client-side functionality

### External Services
- **OpenAI API**: Content generation using GPT models
- **Stripe API**: Payment processing and subscription management

### Data Flow
1. User uploads assets to a project
2. Assets are processed to extract text content
3. User creates or imports prompts
4. Content generation combines assets with prompts
5. Generated content can be analysed for SEO optimisation
6. User can download, edit or further refine content

## Installation

### Prerequisites
- Python 3.8+
- Node.js and npm (for Tailwind CSS)
- Redis server
- MariaDB database

### Setup Steps

1. Clone the repository
```bash
git clone https://github.com/djangify/ai-marketing2.git
cd ai-marketing-platform
```

2. Create a virtual environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies
```bash
pip install -r requirements.txt
```

4. Set up environment variables (create .env file)
```
SECRET_KEY=your_secret_key

DATABASE_NAME=your_db_name
DATABASE_USER=your_db_user
DATABASE_PASSWORD=your_db_password
DATABASE_HOST=127.0.0.1
DATABASE_PORT=3306

OPENAI_API_KEY=your_openai_api_key

STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
STRIPE_SECRET_KEY=your_stripe_secret_key
STRIPE_WEBHOOK_SECRET=your_stripe_webhook_secret
STRIPE_PRICE_ID_MONTHLY=price_id_here
STRIPE_PRICE_ID_QUARTERLY=price_id_here
STRIPE_PRICE_ID_YEARLY=price_id_here

REDIS_URL=redis://localhost:6379/0
CELERY_BROKER_URL=rediss://default:.upstash.io:6379
CELERY_RESULT_BACKEND=rediss://defaultA.upstash.io:6379

EMAIL_HOST=localhost
EMAIL_PORT=25
EMAIL_USE_TLS=False
EMAIL_USE_SSL=False
EMAIL_HOST_USER=admin@yourdomain.com
EMAIL_HOST_PASSWORD=your_email_password
DEFAULT_FROM_EMAIL=admin@yourdomain.com
CONTACT_EMAIL=admin@yourdomain.com

SITE_URL=http://yourdomain.com

```

5. Run migrations
```bash
python manage.py migrate
```

6. Create an admin user
```bash
python manage.py createsuperuser
```

7. Run initial setup commands
```bash
python manage.py create_default_ai_config
python manage.py create_default_templates
```

8. Start the development server
```bash
python manage.py runserver
```

9. Start Celery worker (in a separate terminal)
```bash
celery -A ai_marketing worker -l info
```

## Configuration

### OpenAI API
The platform uses OpenAI's GPT models for content generation. Configure your API key in the .env file:
```
OPENAI_API_KEY=your_openai_api_key
OPENAI_DEFAULT_MODEL=gpt-4o
OPENAI_FALLBACK_MODEL=gpt-3.5-turbo
```

### Database
The application is optimized for MariaDB running on cPanel hosting:
```
DATABASE_NAME=your_db_name
DATABASE_USER=your_db_user
DATABASE_PASSWORD=your_db_password
DATABASE_HOST=127.0.0.1
DATABASE_PORT=3306
```

### Stripe Integration
For subscription management, configure Stripe API keys:
```
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
STRIPE_SECRET_KEY=your_stripe_secret_key
STRIPE_WEBHOOK_SECRET=your_stripe_webhook_secret
STRIPE_PRICE_ID_MONTHLY=price_id_here
STRIPE_PRICE_ID_QUARTERLY=price_id_here
STRIPE_PRICE_ID_YEARLY=price_id_here
```

### Token Limits
Configure token usage limits for different subscription tiers:
```python
# In settings.py
MAX_TOKENS_ASSETS = 100000  # Maximum tokens for assets per user
MAX_TOKENS_PROMPT = 20000   # Maximum tokens per prompt
```

## Usage Guide

### Creating a Project
1. Log in to your account
2. Navigate to the Projects section
3. Click "Create Project" and enter a title and keywords
4. Your project will have three tabs:
   - Upload (for assets)
   - Prompts (for instructions)
   - Generate (for content creation)

### Uploading Assets
1. Navigate to the Upload tab in your project
2. Drag and drop files or click to select files
3. Supported formats: .txt, .md, .pdf (audio/video require processing)
4. Assets will be processed automatically to extract content

### Creating Prompts
1. Navigate to the Prompts tab in your project
2. Click "Add Prompt" to create a new prompt
3. Enter a name and detailed instructions
4. Save the prompt to use in content generation
5. Alternatively, load prompts from templates or the prompt generator

### Generating Content
1. Navigate to the Generate tab in your project
2. Select language preference (US/UK English)
3. Click "Generate Content"
4. Wait for the generation process to complete
5. View, edit, or download your generated content

### Using Templates
1. Navigate to Templates section
2. Create a new template or view existing ones
3. Add prompts to your template
4. Import a template to your project from the Prompts tab

### Using the Prompt Generator
1. Navigate to the Prompt Generator section
2. Browse templates by category or view featured templates
3. Select a template that matches your needs
4. Fill in the required parameters
5. Save your generated prompt or use it directly in a project

### SEO Analysis
1. Generate content for your project
2. Navigate to the content section
3. Click "Evaluate Content" for SEO insights
4. View:
   - SEO score
   - Readability metrics
   - Keyword density analysis
   - Suggested improvements

## API Documentation

The platform includes a RESTful API for integration with other systems:

### Authentication
API requests require authentication using session or token auth:
```python
# Token-based authentication
headers = {
    'Authorization': f'Token {your_token}',
    'Content-Type': 'application/json',
}
```

### Key Endpoints

#### Assets
- `GET /api/assets/` - List all assets
- `POST /api/assets/` - Create a new asset
- `GET /api/assets/{id}/` - Get asset details
- `PATCH /api/assets/{id}/` - Update asset details
- `DELETE /api/assets/{id}/` - Delete an asset

#### Projects
- `GET /api/projects/` - List all projects
- `POST /api/projects/` - Create a new project
- `GET /api/projects/{id}/` - Get project details
- `PATCH /api/projects/{id}/` - Update project details
- `DELETE /api/projects/{id}/` - Delete a project

#### Content Generation
- `POST /api/content/generate/` - Generate content using prompts and assets
- `GET /api/content/{id}/` - Get generated content

See [complete API documentation](api/views/) for more endpoints and details.

## Project Structure

The application follows a modular Django structure with these key components:

```
ai_marketing/               # Main project directory
├── ai_marketing/           # Project configuration
│   ├── settings.py         # Settings and configuration
│   ├── urls.py             # URL routing
│   ├── celery.py           # Celery configuration
│   └── wsgi.py             # WSGI configuration
├── accounts/               # User management
├── api/                    # API endpoints
├── assets/                 # Asset management
├── blog/                   # Blog functionality
├── content_generation/     # AI content generation
├── content_templates/      # Template management
├── core/                   # Core functionality
├── docs/                   # Documentation
├── projects/               # Project management
├── prompt_generator/       # Prompt generation tools
├── prompts/                # Prompt management
├── seo_optimization/       # SEO analysis tools
├── subscriptions/          # Subscription management
├── static/                 # Static files
├── templates/              # HTML templates
├── manage.py               # Django management script
└── requirements.txt        # Python dependencies
```

## License

Copyright © 2025 Diane Corriette 
All Rights Reserved.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)

This software is provided under a proprietary license.  
You may not use, copy, modify, or distribute any part of it  
without the express written permission of the copyright holder.
See the [LICENSE.md](LICENSE.md) file for details.
## Developer
Diane Corriette
@todianedev 
https://www.djangify.com
