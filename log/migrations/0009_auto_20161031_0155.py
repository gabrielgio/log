# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-31 01:55
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0008_auto_20161031_0112'),
    ]

    operations = [
        migrations.AlterField(
            model_name='logitem',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]