from django.contrib import admin
from .models import DatosPersonales, Rol, UsuarioRol

admin.site.register(DatosPersonales)
admin.site.register(Rol)
admin.site.register(UsuarioRol)
