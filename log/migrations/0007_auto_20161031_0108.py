# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-31 01:08
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('log', '0006_auto_20161031_0005'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='logitem',
            name='user',
        ),
        migrations.AddField(
            model_name='logitem',
            name='user',
            field=models.ManyToManyField(default=1, related_name='log_item', to=settings.AUTH_USER_MODEL),
        ),
    ]
