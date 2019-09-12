from django.db import models
from django.contrib.auth.models import User




DOC_CHOICES = (
    ('CC',(u"Cédula de Ciudadanía (CC)")),
    ('CE',(u"Cédula de Extranjería (CE)")),
    ('DNI',(u"Documento Nacional de Identidad (DNI)")),
    ('DUI',(u"Documento Único de Identidad (DUI)")),
)

class DatosPersonales(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50, blank=True, null=True)
    tipoid = models.CharField(max_length=20, blank=True, null=True, choices=DOC_CHOICES, default='CC')
    numeroid = models.CharField(max_length=20, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    correo = models.CharField(max_length=50, blank=True, null=True)
    foto = models.ImageField(upload_to='usuarios', default='usuarios/usuario.png')
    usuid = models.OneToOneField(User, on_delete = models.CASCADE)

    def __str__(self):
        return "%s %s" % (self.datnombre, self.datapellido)

    class Meta:
        verbose_name_plural = "Datos Personales"
        verbose_name = "Datos Persona"

class Rol(models.Model):
    rolid = models.AutoField(primary_key=True)
    roltipo = models.CharField(max_length=50)

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
