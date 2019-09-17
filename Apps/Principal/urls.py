from django.urls import path
from .views import Inicio, Nosotros, Servicios, Contacto

urlpatterns = [
    path('',Inicio.as_view(), name = 'index'),
    path('nosotros/',Nosotros.as_view(), name = 'nosotros'),
    path('servicios/',Servicios.as_view(), name = 'servicios'),
    path('contactenos/',Contacto.as_view(), name = 'contactenos'),

]
