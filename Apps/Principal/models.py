from django.db import models
from django.core.mail import send_mail


class ModeloBase(models.Model):
    id = models.AutoField(primary_key = True)
    estado = models.BooleanField('Estado',default = True)
    fecha_creacion = models.DateField('Fecha de Creación',auto_now = False, auto_now_add = True)
    fecha_modificacion = models.DateField('Fecha de Modificación',auto_now = True, auto_now_add = False)
    fecha_eliminacion = models.DateField('Fecha de Eliminación',auto_now = True, auto_now_add = False)

    class Meta:
        abstract = True


class Web(ModeloBase):
    nosotros = models.TextField('Nosotros')
    telefono = models.CharField('Teléfono', max_length = 10)
    email = models.EmailField('Correo Electrónico', max_length = 200)
    direccion = models.CharField('Dirección', max_length = 200)

    class Meta:
        verbose_name = 'Web'
        verbose_name_plural = 'Webs'

    def __str__(self):
        return self.nosotros

class RedesSociales(ModeloBase):
    facebook = models.URLField('Facebook')
    twitter = models.URLField('Twitter')
    instagram = models.URLField('Instagram')

    class Meta:
        verbose_name = 'Red Social'
        verbose_name_plural = 'Redes Sociales'

    def __str__(self):
        return self.facebook

class Principal(ModeloBase):
    titulo = models.CharField('titulo', max_length = 50)
    descripcion = models.TextField('Descripcion')

    class Meta:
        verbose_name = 'Principal'
        verbose_name_plural = 'Principales'

    def __str__(self):
        return self.descripcion


class OpinionesClientes(ModeloBase):
    usuario = models.CharField('Usuario', max_length = 50)
    imagen_usuario = models.ImageField('Imagen Referencial',upload_to = 'clientes/')
    rol = models.CharField('Rol', blank = True, max_length = 50)
    mensaje = models.TextField('Mensaje')

    class Meta:
        verbose_name = 'Opinion Cliente'
        verbose_name_plural = 'Opiniones Clientes'

    def __str__(self):
        return self.mensaje


class Servicios(ModeloBase):
    titulo = models.CharField('titulo', max_length = 50)
    descripcion = models.TextField('Mensaje')

    class Meta:
        verbose_name = 'Servicio'
        verbose_name_plural = 'Servicios'

    def __str__(self):
        return self.titulo


class Desarrollador(ModeloBase):
    foto = models.ImageField('Imagen Referencial',upload_to = 'desarrolladores/')
    nombre = models.CharField('Nombre', max_length = 50)
    cargo = models.CharField('Cargo', max_length = 50)
    facebook = models.URLField('Facebook')
    twitter = models.URLField('Twitter')
    instagram = models.URLField('Instagram')

    class Meta:
        verbose_name = 'Desarrollador'
        verbose_name_plural = 'Desarrolladores'

    def __str__(self):
        return self.nombre


class Contacto(ModeloBase):
    nombre = models.CharField('Nombre', max_length = 100)
    correo = models.EmailField('Correo Electrónico', max_length = 200)
    asunto = models.CharField('Asunto', max_length = 100)
    mensaje = models.TextField('Mensaje')

    class Meta:
        verbose_name = 'Contacto'
        verbose_name_plural = 'Contactos'

    def __str__(self):
        return self.asunto

class Subscriptor(models.Model):
    subid = models.AutoField(primary_key=True)
    subemail = models.EmailField('Correo Electrónico', max_length = 200)

    class Meta:
        verbose_name = 'Subscriptor'
        verbose_name_plural = 'Subscriptores'

    def __str__(self):
        return self.subemail
