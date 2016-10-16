# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect
from log.models import LogItem
from django.core.files.base import ContentFile
import markdown2
import pickle

class LogItemViewModel:
    
    def __init__(self, content, title):
        self.title = title
        self.content = content
        

def index(request):
    log_items = LogItem.objects.order_by('-update')[:5]
    log_items_view = []

    for item in log_items:
        html = markdown2.markdown(item.md, extras=['tables'])
        item_view = LogItemViewModel(html, item.title)
        log_items_view.append(item_view)

    return render(request, 'index.html', {'items' : log_items_view})

def create(request):
    if request.method == 'POST':
        return _post_create(request)
    else:
        return _get_create(request)

def _get_create(request):
    return render(request, 'create.html')

def _post_create(request):
    title = request.POST.get('title')
    md = request.POST.get('md')
    log = LogItem(title=title, md=md)
    log.save()
    return redirect('index')
