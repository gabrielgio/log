# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from log.models import LogItem
import markdown2

class LogItemViewModel:
    
    def __init__(self, content, title):
        self.title = title
        self.content = content
        

def index(request):
    log_items = LogItem.objects.order_by('update')[:5]
    log_items_view = []

    for item in log_items:
        html = markdown2.markdown(item.md.read(), extras=['tables'])
        item_view = LogItemViewModel(html, item.title)
        log_items_view.append(item_view)

    return render(request, 'index.html', {'items' : log_items_view})
