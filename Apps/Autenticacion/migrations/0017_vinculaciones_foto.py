# Generated by Django 2.2.5 on 2019-09-28 02:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Autenticacion', '0016_auto_20190928_0148'),
    ]

    operations = [
        migrations.AddField(
            model_name='vinculaciones',
            name='foto',
            field=models.ImageField(null=True, upload_to='vinculaciones', verbose_name='foto'),
        ),
    ]