from django.db import models
from django.contrib.auth.models import User




DOC_CHOICES = (
    ('CC',(u"Cédula de Ciudadanía (CC)")),
    ('CE',(u"Cédula de Extranjería (CE)")),
    ('DNI',(u"Documento Nacional de Identidad (DNI)")),
    ('DUI',(u"Documento Único de Identidad (DUI)")),
)

GEN_CHOICES = (
    ('M',(u"Maculino (M)")),
    ('F',(u"Femenino (F)")),
    ('O',(u"Otro (O)")),
)


class DatosPersonales(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField('Nombre', max_length=50)
    apellido = models.CharField('Apellido', max_length=50)
    tipoid = models.CharField('Tipo Identificacion', max_length=20,choices=DOC_CHOICES, default='CC')
    numeroid = models.CharField('Numero de identificacion', max_length=20)
    telefono = models.CharField('Telefono', max_length=20)
    correo = models.CharField('Correo', max_length=50)
    foto = models.ImageField('foto', upload_to='usuarios', default='usuarios/usuario.png')
    usuid = models.OneToOneField(User, on_delete = models.CASCADE)

    def __str__(self):
        return "%s %s" % (self.nombre, self.apellido)

    class Meta:
        verbose_name_plural = "Datos Personales"
        verbose_name = "Datos Persona"

class Rol(models.Model):
    rolid = models.AutoField(primary_key=True)
    roltipo = models.CharField('Tipo de rol', max_length=50)

    def __str__(self):
        return self.roltipo

    class Meta:
        verbose_name_plural = "Roles"
        verbose_name = "Rol"

class UsuarioRol(models.Model):
    rolid = models.ForeignKey(Rol, on_delete = models.CASCADE)
    usuid = models.ForeignKey(User, on_delete = models.CASCADE)

    def __str__(self):
        return "%s-%s" % (self.rolid.roltipo, self.usuid.username)

    class Meta:
        verbose_name_plural = "Roles Usuarios"
        verbose_name = "Rol Usuario"
