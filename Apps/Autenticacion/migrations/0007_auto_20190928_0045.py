# Generated by Django 2.2.5 on 2019-09-28 00:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Autenticacion', '0006_remove_paciente_nombre_usuario'),
    ]

    operations = [
        migrations.AlterField(
            model_name='paciente',
            name='correo',
            field=models.EmailField(max_length=50, null='True', verbose_name='Correo'),
        ),
    ]
