# Generated by Django 2.2.5 on 2019-09-04 13:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Principal', '0005_auto_20190904_1303'),
    ]

    operations = [
        migrations.AddField(
            model_name='opinionesclientes',
            name='rol',
            field=models.CharField(blank=True, max_length=50, verbose_name='Rol'),
        ),
    ]
