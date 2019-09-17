from django.urls import path
from .views import Inicio, Nosotros

urlpatterns = [
    path('',Inicio.as_view(), name = 'index'),
    path('nosotros/',Nosotros.as_view(), name = 'nosotros'),
]
