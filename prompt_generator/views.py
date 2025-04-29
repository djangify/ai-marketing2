# prompt_generator/views.py
import re
from django import forms
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from django.urls import reverse
from subscriptions.utils import subscription_required
from .models import GeneratorCategory, GeneratorTemplate, GeneratorParameter, GeneratedPrompt
from .forms import PromptGeneratorForm, SaveGeneratedPromptForm
from prompts.utils.token_helper import getPromptTokenCount
from prompts.utils.token_tracker import add_prompt_tokens
import json


@login_required
@subscription_required
def prompt_generator_home(request):
    """Home page for the prompt generator"""
    categories = GeneratorCategory.objects.filter(is_active=True)
    featured_templates = GeneratorTemplate.objects.filter(is_active=True, is_featured=True)
    recent_prompts = GeneratedPrompt.objects.filter(user=request.user).order_by('-created_at')[:5]
    
    context = {
        'categories': categories,
        'featured_templates': featured_templates,
        'recent_prompts': recent_prompts,
    }
    
    return render(request, 'prompt_generator/generator.html', context)

@login_required
@subscription_required
def generator_categories(request):
    """View all generator categories"""
    categories = GeneratorCategory.objects.filter(is_active=True)
    
    context = {
        'categories': categories,
    }
    
    return render(request, 'prompt_generator/generator_categories.html', context)

@login_required
@subscription_required
def generator_category(request, category_id):
    """View templates for a specific category"""
    category = get_object_or_404(GeneratorCategory, id=category_id, is_active=True)
    templates = GeneratorTemplate.objects.filter(category=category, is_active=True)
    
    context = {
        'category': category,
        'templates': templates,
    }
    
    return render(request, 'prompt_generator/generator_category.html', context)


@login_required
@subscription_required
def generate_prompt(request, template_id):
    """
    GET:  render generator_prompt.html with a dynamic form
    POST: build prompt_text, count tokens, then render generator_result.html
    """
    template = get_object_or_404(GeneratorTemplate, id=template_id, is_active=True)
    parameters = template.parameters.all().order_by('order')
    
    # Create a unique session key for this template
    session_key = f"prompt_generator_template_{template_id}"

    if request.method == 'POST':
        # Normal form processing for generating prompt
        param_values = {}
        for param in parameters:
            if param.parameter_type == 'checkbox':
                # Get checkbox values from POST data
                chosen = []
                for k in request.POST.keys():
                    if k.startswith(f"{param.name}_") and request.POST[k]:
                        chosen.append(request.POST[k])
                param_values[param.name] = ", ".join(chosen)
            else:
                param_values[param.name] = request.POST.get(param.name, "") or ""
        
        # Store values in session
        request.session[session_key] = param_values
        request.session.save()  # Force save session

        # Generate the prompt text
        def _replacer(match):
            key = match.group(1).strip()
            if key == "liked/disliked":
                key = "customer_sentiment"
            return param_values.get(key, match.group(0))

        raw = template.template_text
        prompt_text = re.sub(r"{\s*([^}]+)\s*}", _replacer, raw)

        # Count tokens and prepare save form
        token_count = getPromptTokenCount(prompt_text)
        save_form = SaveGeneratedPromptForm(initial={
            "name": f"{template.name} - {template.category.name}",
            "prompt_text": prompt_text,
        })

        return render(request, "prompt_generator/generator_result.html", {
            "template":     template,
            "parameters":   parameters,
            "prompt_text":  prompt_text,
            "token_count":  token_count,
            "param_values": param_values,
            "save_form":    save_form,
        })

    # GET: build the dynamic PromptGeneratorForm
    form = PromptGeneratorForm(initial={"template": template})
    
    # Try to retrieve saved values from session
    saved_values = request.session.get(session_key, {})
    
    for param in parameters:
        # Get the initial value (either from session or default)
        initial_value = saved_values.get(param.name, param.default_value or "")
        
        base = dict(
            label=param.display_name,
            help_text=param.description or "",
            required=param.is_required,
            initial=initial_value,
            widget=forms.TextInput(attrs={
                "class": "w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-main"
            })
        )
        
        if param.parameter_type == "select":
            choices = [(o.strip(), o.strip()) for o in (param.options or "").split(",") if o.strip()]
            form.fields[param.name] = forms.ChoiceField(
                choices=choices,
                widget=forms.Select(attrs=base["widget"].attrs),
                label=base["label"],
                help_text=base["help_text"],
                required=base["required"],
                initial=base["initial"],
            )
        elif param.parameter_type == "radio":
            choices = [(o.strip(), o.strip()) for o in (param.options or "").split(",") if o.strip()]
            form.fields[param.name] = forms.ChoiceField(
                choices=choices,
                widget=forms.RadioSelect(),
                label=base["label"],
                help_text=base["help_text"],
                required=base["required"],
                initial=base["initial"],
            )
        elif param.parameter_type == "checkbox":
            choices = [(o.strip(), o.strip()) for o in (param.options or "").split(",") if o.strip()]
            
            # For checkbox, convert comma-separated string to list
            selected_options = []
            if param.name in saved_values and saved_values[param.name]:
                selected_options = [opt.strip() for opt in saved_values[param.name].split(",")]
            
            form.fields[param.name] = forms.MultipleChoiceField(
                choices=choices,
                widget=forms.CheckboxSelectMultiple(),
                required=False,
                label=base["label"],
                help_text=base["help_text"],
                initial=selected_options,
            )
        else:
            form.fields[param.name] = forms.CharField(**base)

    return render(request, "prompt_generator/generator_prompt.html", {
        "template":   template,
        "parameters": parameters,
        "form":       form,
    })


@login_required
@subscription_required
def save_prompt(request):
    """Save a generated prompt and redirect back to the saved-prompts list."""
    if request.method != "POST":
        return redirect("prompt_generator:generator")

    name = request.POST.get("name", "").strip()
    prompt_text = request.POST.get("prompt_text", "").strip()
    if not name or not prompt_text:
        from django.contrib import messages
        messages.error(request, "Name and prompt text are required.")
        return redirect("prompt_generator:generator")

    # build the model
    prompt = GeneratedPrompt(user=request.user, name=name, prompt_text=prompt_text)
    tpl_id = request.POST.get("template_id")
    if tpl_id:
        from .models import GeneratorTemplate
        try:
            prompt.template = GeneratorTemplate.objects.get(id=tpl_id)
        except GeneratorTemplate.DoesNotExist:
            pass

    # collect param_ values
    params = {}
    for k, v in request.POST.items():
        if k.startswith("param_"):
            params[k[6:]] = v
    prompt.parameters_used = params

    # token tracking
    prompt.token_count = getPromptTokenCount(prompt.prompt_text)
    add_prompt_tokens(request.user, prompt.token_count)
    prompt.save()

    from django.contrib import messages
    messages.success(request, "Prompt saved successfully!")
    return redirect("prompt_generator:generator_templates")


@login_required
@subscription_required
def generator_templates(request):
    """View user's saved prompts"""
    prompts = GeneratedPrompt.objects.filter(user=request.user).order_by('-created_at')
    
    context = {
        'prompts': prompts,
    }
    
    return render(request, 'prompt_generator/generator_templates.html', context)

@login_required
@subscription_required
def generator_detail(request, prompt_id):
    """View a specific prompt"""
    prompt = get_object_or_404(GeneratedPrompt, id=prompt_id, user=request.user)
    
    context = {
        'prompt': prompt,
    }
    
    return render(request, 'prompt_generator/generator_detail.html', context)

@login_required
@subscription_required
def use_in_project(request, prompt_id):
    """Use a generated prompt in a project"""
    if request.method == 'POST':
        prompt = get_object_or_404(GeneratedPrompt, id=prompt_id, user=request.user)
        project_id = request.POST.get('project_id')
        
        if not project_id:
            messages.error(request, "Please select a project")
            return redirect('prompt_generator:prompt_detail', prompt_id=prompt_id)
        
        # Create a new prompt in the selected project
        from projects.models import Project
        from prompts.models import Prompt  # Use the specific import
        
        project = get_object_or_404(Project, id=project_id, user=request.user)
        
        # Get highest order for new prompt
        highest_order = Prompt.objects.filter(project=project).order_by('-order').values_list('order', flat=True).first()
        next_order = 0 if highest_order is None else highest_order + 1
        
        # Create the prompt
        try:
            project_prompt = Prompt.objects.create(
                project=project,
                name=prompt.name,
                prompt=prompt.prompt_text,
                token_count=prompt.token_count,
                order=next_order
            )
            
            messages.success(request, f"Prompt '{prompt.name}' added to project: {project.title}")
        except Exception as e:
            import traceback
            print(f"Error creating prompt: {str(e)}")
            print(traceback.format_exc())
            messages.error(request, f"Error adding prompt to project: {str(e)}")
            return redirect('prompt_generator:prompt_detail', prompt_id=prompt_id)
        
        # Redirect to the project detail page with the prompts tab active
        return redirect(f"{reverse('projects:project_detail', kwargs={'project_id': project.id})}?tab=prompts")
    
    return redirect('prompt_generator:prompt_detail', prompt_id=prompt_id)

@login_required
def generator_confirm_delete(request, prompt_id):
    """Delete a generated prompt"""
    prompt = get_object_or_404(GeneratedPrompt, id=prompt_id, user=request.user)
    
    if request.method == 'POST':
        prompt.delete()
        messages.success(request, "Prompt deleted successfully")
        return redirect('prompt_generator:generator_templates')
    
    context = {
        'prompt': prompt,
    }
    
    return render(request, 'prompt_generator/generator_confirm_delete.html', context)
