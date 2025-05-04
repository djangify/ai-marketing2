# seo_optimization/tasks.py
from celery import shared_task
import openai
from django.conf import settings
import logging
import json

logger = logging.getLogger(__name__)

@shared_task(bind=True, max_retries=3)
def analyze_content_seo(self, content_id):
    """Analyze generated content for SEO optimization"""
    try:
        from content_generation.models import GeneratedContent
        content = GeneratedContent.objects.get(id=content_id)
        
        # Prepare the SEO analysis prompt
        prompt = f"""Analyze the following content for SEO optimization and provide recommendations:

Content: {content.result[:2000]}  # Limit to first 2000 chars to save tokens

Provide analysis in the following JSON format:
{{
    "keyword_density": {{"primary_keywords": [], "density_score": 0-100}},
    "readability": {{"score": 0-100, "grade_level": "text"}},
    "meta_suggestions": {{"title": "text", "description": "text"}},
    "improvements": ["suggestion1", "suggestion2", "suggestion3"],
    "overall_score": 0-100
}}"""

        client = openai.OpenAI(api_key=settings.OPENAI_API_KEY)
        
        response = client.chat.completions.create(
            model=settings.OPENAI_DEFAULT_MODEL,
            messages=[
                {"role": "system", "content": "You are an SEO expert. Analyze content and provide specific, actionable recommendations."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.3,
            response_format={"type": "json_object"}
        )
        
        seo_analysis = json.loads(response.choices[0].message.content)
        
        # Store SEO analysis
        from seo_optimization.models import SEOAnalysis
        SEOAnalysis.objects.create(
            content=content,
            keyword_density=seo_analysis.get('keyword_density', {}),
            readability_score=seo_analysis.get('readability', {}).get('score', 0),
            meta_suggestions=seo_analysis.get('meta_suggestions', {}),
            improvements=seo_analysis.get('improvements', []),
            overall_score=seo_analysis.get('overall_score', 0)
        )
        
        return f"SEO analysis completed for content {content_id}"
        
    except Exception as e:
        logger.error(f"SEO analysis failed: {str(e)}")
        self.retry(exc=e)

@shared_task
def batch_analyze_project_seo(project_id):
    """Analyze all content in a project for SEO"""
    from projects.models import Project
    
    try:
        project = Project.objects.get(id=project_id)
        contents = project.generated_contents.all()
        
        for content in contents:
            analyze_content_seo.delay(content.id)
        
        return f"Started SEO analysis for {contents.count()} content items in project {project_id}"
    
    except Exception as e:
        logger.error(f"Batch SEO analysis failed: {str(e)}")
        return f"Failed to start batch SEO analysis: {str(e)}"
    