# -*- coding: utf-8 -*-
# Generated by Django 1.11.dev20161008120706 on 2016-10-15 19:58
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0002_auto_20161013_0006'),
    ]

    operations = [
        migrations.AddField(
            model_name='logitem',
            name='update',
            field=models.DateTimeField(default=datetime.datetime.now),
        ),
    ]
