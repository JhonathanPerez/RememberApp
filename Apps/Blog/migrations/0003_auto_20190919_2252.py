# Generated by Django 2.2.5 on 2019-09-19 22:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Blog', '0002_auto_20190919_2230'),
    ]

    operations = [
        migrations.AlterField(
            model_name='autor',
            name='imagen_referencial',
            field=models.ImageField(blank=True, null=True, upload_to='blog/autores/', verbose_name='Imagen Referencial'),
        ),
        migrations.AlterField(
            model_name='categoria',
            name='imagen_referencial',
            field=models.ImageField(upload_to='blog/categoria/', verbose_name='Imagen Referencial'),
        ),
    ]
