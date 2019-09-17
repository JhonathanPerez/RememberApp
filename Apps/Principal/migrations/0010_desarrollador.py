# Generated by Django 2.2.5 on 2019-09-17 15:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Principal', '0009_remove_servicios_imagen'),
    ]

    operations = [
        migrations.CreateModel(
            name='Desarrollador',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('estado', models.BooleanField(default=True, verbose_name='Estado')),
                ('fecha_creacion', models.DateField(auto_now_add=True, verbose_name='Fecha de Creación')),
                ('fecha_modificacion', models.DateField(auto_now=True, verbose_name='Fecha de Modificación')),
                ('fecha_eliminacion', models.DateField(auto_now=True, verbose_name='Fecha de Eliminación')),
                ('foto', models.ImageField(upload_to='desarrolladores/', verbose_name='Imagen Referencial')),
                ('nombre', models.CharField(max_length=50, verbose_name='Nombre')),
                ('cargo', models.CharField(max_length=50, verbose_name='Cargo')),
                ('facebook', models.URLField(verbose_name='Facebook')),
                ('twitter', models.URLField(verbose_name='Twitter')),
                ('instagram', models.URLField(verbose_name='Instagram')),
            ],
            options={
                'verbose_name': 'Desarrollador',
                'verbose_name_plural': 'Desarrolladores',
            },
        ),
    ]
