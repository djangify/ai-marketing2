from django.db import models
from django.contrib.auth.models import User
import uuid
from projects.models import Project, Prompt

class ContentGenerationJob(models.Model):
    """Model to track the status of content generation jobs"""
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('in_progress', 'In Progress'),
        ('completed', 'Completed'),
        ('failed', 'Failed'),
        ('canceled', 'Canceled'),
    ]
    
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='generation_jobs')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    started_at = models.DateTimeField(auto_now_add=True)
    completed_at = models.DateTimeField(null=True, blank=True)
    prompts_total = models.IntegerField(default=0)
    prompts_completed = models.IntegerField(default=0)
    error_message = models.TextField(blank=True, null=True)
    
    def __str__(self):
        return f"Generation Job for {self.project.title} ({self.status})"
    
    class Meta:
        ordering = ['-started_at']

class AIConfig(models.Model):
    """Model to store AI configuration settings"""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=100)
    model_name = models.CharField(max_length=100, default="gpt-4o")
    fallback_model = models.CharField(max_length=100, default="gpt-3.5-turbo", blank=True)
    temperature = models.FloatField(default=0.7)
    max_tokens = models.IntegerField(default=4000)
    is_active = models.BooleanField(default=True)
    
    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = "AI Configuration"
        verbose_name_plural = "AI Configurations"

class PromptTemplate(models.Model):
    """Model to store prompt templates for layering"""
    CONTENT_TYPE_CHOICES = [
        ('general', 'General Content'),
        ('blog', 'Blog Post'),
        ('social', 'Social Media'),
        ('email', 'Email Marketing'),
        ('custom', 'Custom'),
    ]
    
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=100)
    content_type = models.CharField(max_length=20, choices=CONTENT_TYPE_CHOICES)
    system_prompt = models.TextField(help_text="System prompt template for the AI assistant")
    description = models.TextField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_default = models.BooleanField(default=False, help_text="Whether this is the default template for this content type")
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True, help_text="If null, this is a system template")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.name} ({self.get_content_type_display()})"
    
    class Meta:
        verbose_name = "Prompt Template"
        verbose_name_plural = "Prompt Templates"
        unique_together = [('content_type', 'is_default', 'user')]
        