# Generated by Django 2.2.5 on 2019-09-28 00:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Autenticacion', '0007_auto_20190928_0045'),
    ]

    operations = [
        migrations.CreateModel(
            name='Vinculaciones',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=50, verbose_name='Nombre')),
                ('apellido', models.CharField(max_length=50, null='True', verbose_name='Apellido')),
                ('cuidador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Autenticacion.DatosPersonales')),
            ],
            options={
                'verbose_name': 'Paciente',
                'verbose_name_plural': 'Pacientes',
            },
        ),
    ]
