# Generated by Django 2.2.5 on 2019-09-28 03:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Autenticacion', '0018_remove_vinculaciones_foto'),
    ]

    operations = [
        migrations.AddField(
            model_name='paciente',
            name='cuidador_id',
            field=models.CharField(max_length=50, null='True', verbose_name='Cuidador_ID'),
            preserve_default='True',
        ),
    ]
