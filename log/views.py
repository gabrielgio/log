# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from models import LogItem
import markdown2

class LogItemViewModel:
    
    def __init__(self, content, title):
        self.title = title
        self.content = content
        

def index(request):
    return render(request, 'index.html')

def index_log(request):
    log_item = LogItem.objects.get(id=3)
    html = markdown2.markdown(log_item.md.read())
    log_item_view = LogItemViewModel(html, log_item.title)
    return render(request, 'index.html', {'i': log_item_view})
