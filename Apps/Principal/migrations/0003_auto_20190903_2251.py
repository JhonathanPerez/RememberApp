# Generated by Django 2.2.5 on 2019-09-03 22:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Principal', '0002_principal'),
    ]

    operations = [
        migrations.AlterField(
            model_name='principal',
            name='descripcion',
            field=models.TextField(verbose_name='Descripcion'),
        ),
    ]
