# Generated by Django 2.2.5 on 2019-09-28 01:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Autenticacion', '0010_vinculaciones_foto'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vinculaciones',
            name='foto',
        ),
    ]
