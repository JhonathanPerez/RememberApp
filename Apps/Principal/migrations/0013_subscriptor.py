# Generated by Django 2.2.5 on 2019-09-18 19:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Principal', '0012_auto_20190917_1733'),
    ]

    operations = [
        migrations.CreateModel(
            name='Subscriptor',
            fields=[
                ('subid', models.AutoField(primary_key=True, serialize=False)),
                ('subemail', models.EmailField(max_length=200, verbose_name='Correo Electrónico')),
            ],
            options={
                'verbose_name': 'Subscriptor',
                'verbose_name_plural': 'Subscriptores',
            },
        ),
    ]
