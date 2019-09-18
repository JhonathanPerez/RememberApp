# Generated by Django 2.2.5 on 2019-09-17 17:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Principal', '0011_auto_20190917_1547'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contacto',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('estado', models.BooleanField(default=True, verbose_name='Estado')),
                ('fecha_creacion', models.DateField(auto_now_add=True, verbose_name='Fecha de Creación')),
                ('fecha_modificacion', models.DateField(auto_now=True, verbose_name='Fecha de Modificación')),
                ('fecha_eliminacion', models.DateField(auto_now=True, verbose_name='Fecha de Eliminación')),
                ('nombre', models.CharField(max_length=100, verbose_name='Nombre')),
                ('correo', models.EmailField(max_length=200, verbose_name='Correo Electrónico')),
                ('asunto', models.CharField(max_length=100, verbose_name='Asunto')),
                ('mensaje', models.TextField(verbose_name='Mensaje')),
            ],
            options={
                'verbose_name': 'Contacto',
                'verbose_name_plural': 'Contactos',
            },
        ),
        migrations.AlterField(
            model_name='desarrollador',
            name='foto',
            field=models.ImageField(upload_to='desarrolladores/', verbose_name='Imagen Referencial'),
        ),
    ]