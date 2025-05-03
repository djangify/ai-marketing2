# core/views.py
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import ContactMessageForm


def index(request): 
    if request.user.is_authenticated:
        return redirect('accounts:dashboard')
    return render(request, 'index.html')

def quick_start(request): 
    """
    Quick Start documentation
    """
    return render(request, 'quick_start.html')

def policies_index(request):
    """
    View for the index of policies page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': None}
    ]
    
    context = {
        'title': 'Index of all Policies for AI Marketing Platform',
        'meta_description': 'This is the most up to date index of all policies for our website.',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/policies_index.html', context)


def privacy_policy(request):
    """
    View for the privacy policy page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': reverse('core:policies_index')},
        {'title': 'Privacy Policy', 'url': None}
    ]
    
    context = {
        'title': 'Privacy Policy for AI Marketing Platform',
        'meta_description': 'This is the most up to date privacy policy for our website',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/privacy_policy.html', context)


def terms_policy(request):
    """
    View for the terms and conditions policy page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': reverse('core:policies_index')},
        {'title': 'Terms & Conditions', 'url': None}
    ]
    
    context = {
        'title': 'Terms and Conditions Policy for AI Marketing Platform',
        'meta_description': 'This is the most up to date terms and conditions policy for our website',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/terms_policy.html', context)

def advertising_policy(request):
    """
    View for the advertising policy page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': reverse('core:policies_index')},
        {'title': 'Advertising Policy', 'url': None}
    ]
    
    context = {
        'title': 'Advertising Policy for AI Marketing Platform',
        'meta_description': 'This is the most up to date advertising policy for our website',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/advertising_policy.html', context)

def support_policy(request):
    """
    View for the help and support policy page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': reverse('core:policies_index')},
        {'title': 'Help & Support', 'url': None}
    ]
    
    context = {
        'title': 'Help and Support Policy for AI Marketing Platform',
        'meta_description': 'This is the most up to date help and support policy for our website',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/support_policy.html', context)


def cookies_policy(request):
    """
    View for the cookies policy page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': reverse('core:policies_index')},
        {'title': 'Cookies Policy', 'url': None}
    ]
    
    context = {
        'title': 'Cookies Policy for AI Marketing Platform',
        'meta_description': 'This is the most up to date cookies policy for our website',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/cookies_policy.html', context)

def refund_policy(request):
    """
    View for the refund policy page
    """
    breadcrumbs = [
        {'title': 'Policies', 'url': reverse('core:policies_index')},
        {'title': 'Refund Policy', 'url': None}
    ]
    
    context = {
        'title': 'Refund Policy for AI Marketing Platform',
        'meta_description': 'This is the most up to date refund policy for our website',
        'breadcrumbs': breadcrumbs
    }
    return render(request, 'policy/refund_policy.html', context)

@login_required
def contact_us(request):
    if request.method == 'POST':
        form = ContactMessageForm(request.POST)
        if form.is_valid():
            contact_message = form.save(commit=False)
            contact_message.user = request.user
            contact_message.save()
            messages.success(request, "Your message has been sent. We'll get back to you as soon as possible.")
            return redirect('accounts:profile')
    else:
        form = ContactMessageForm()
    
    return render(request, 'core/contact_form.html', {'form': form})

def handler404(request, exception):
    """Custom 404 error page"""
    return render(request, 'errors/404.html', status=404)

def handler500(request):
    """Custom 500 error page"""
    return render(request, 'errors/500.html', status=500)

def handler403(request, exception):
    """Custom 403 error page"""
    return render(request, 'errors/403.html', status=403)

# In core/views.py
def robots_txt(request):
    """Serve robots.txt file"""
    lines = [
        "User-agent: *",
        "Disallow: /admin/",
        "Disallow: /dashboard/",
        "Disallow: /projects/",
        "Disallow: /assets/",
        "Disallow: /prompts/",
        "Disallow: /content-generation/",
        "Disallow: /templates/",
        "Disallow: /seo-optimization/",
        "Disallow: /prompt-generator/",
        "Disallow: /documentation/",
        "Allow: /",
        "Allow: /blog/",
        "Allow: /quick_start/",
        "Allow: /policies/",
        "",
        f"Sitemap: {request.build_absolute_uri('/sitemap.xml')}"
    ]
    return HttpResponse("\n".join(lines), content_type="text/plain")