# Generated by Django 2.2.5 on 2019-09-28 00:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Autenticacion', '0005_auto_20190928_0026'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='paciente',
            name='nombre_usuario',
        ),
    ]