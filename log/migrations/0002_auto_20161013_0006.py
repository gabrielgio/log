# -*- coding: utf-8 -*-
# Generated by Django 1.11.dev20161008120706 on 2016-10-13 00:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='logitem',
            name='md',
            field=models.FileField(upload_to='files/'),
        ),
    ]
