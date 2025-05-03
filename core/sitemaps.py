# core/sitemaps.py
from django.contrib.sitemaps import Sitemap
from django.urls import reverse
from blog.models import Post


class StaticViewSitemap(Sitemap):
    priority = 0.5
    changefreq = 'weekly'

    def items(self):
        # Only public pages
        return [
            'home',
            'quick_start',
            'accounts:login',
            'accounts:signup',
            'core:policies_index',
            'core:privacy_policy',
            'core:terms_conditions',
            'core:contact_us',
            'blog:blog_list',
        ]

    def location(self, item):
        return reverse(item)

class BlogSitemap(Sitemap):
    changefreq = "weekly"
    priority = 0.7

    def items(self):
        # Only published blog posts
        return Post.objects.filter(status='published')

    def lastmod(self, obj):
        return obj.updated_at

class PublicDocsSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.6
        
    def lastmod(self, obj):
        return obj.updated_at