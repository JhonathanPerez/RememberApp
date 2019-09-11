# Generated by Django 2.2.5 on 2019-09-04 16:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Principal', '0006_opinionesclientes_rol'),
    ]

    operations = [
        migrations.CreateModel(
            name='Servicios',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('estado', models.BooleanField(default=True, verbose_name='Estado')),
                ('fecha_creacion', models.DateField(auto_now_add=True, verbose_name='Fecha de Creación')),
                ('fecha_modificacion', models.DateField(auto_now=True, verbose_name='Fecha de Modificación')),
                ('fecha_eliminacion', models.DateField(auto_now=True, verbose_name='Fecha de Eliminación')),
                ('titulo', models.CharField(max_length=50, verbose_name='titulo')),
                ('imagen', models.ImageField(upload_to='servicios/', verbose_name='Imagen Referencial')),
                ('descripcion', models.TextField(verbose_name='Mensaje')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
