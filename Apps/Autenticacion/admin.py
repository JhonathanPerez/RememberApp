from django.contrib import admin
from .models import DatosPersonales, Rol, UsuarioRol, Paciente, Vinculaciones

admin.site.register(DatosPersonales)
admin.site.register(Rol)
admin.site.register(UsuarioRol)
admin.site.register(Paciente)
admin.site.register(Vinculaciones)
