# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect
from log.models import LogItem
import markdown2
from log.forms import UserRegister
from django.contrib.auth.models import User

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


def signup(request):
    if request.method == 'POST':
        return _post_signup(request)
    else:
        return _get_signup(request)


def _get_signup(request):
    return render(request, 'signup.html')


def _post_signup(request):
    form = UserRegister(request.POST)
    if form.is_valid():
        data = form.data
        User.objects.create_user(email=data['email'], password=data['password'], username=data['name'])
        return redirect('index')

    return render(request, 'signup.html', {'form': form})


def _get_create(request):
    return render(request, 'create.html')


def _post_create(request):
    title = request.POST.get('title')
    md = request.POST.get('md')
    log = LogItem(title=title, md=md)
    log.save()
    return redirect('index')
