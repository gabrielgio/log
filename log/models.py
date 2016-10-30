# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime
from django.contrib.auth.models import User


class LogItem(models.Model):

    title = models.CharField(max_length=255, null=False)
    md = models.TextField(null=False, max_length=50000)
    update = models.DateTimeField(null=False, default=datetime.now)
    user = models.OneToOneField(User, related_name='log_item',default=0)