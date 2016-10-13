# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models



class LogItem(models.Model):

    title = models.CharField(max_length=255, null=False)
    md = models.FileField(null=False, upload_to='files/')
