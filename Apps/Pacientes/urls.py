from django.urls import path
from .views import Perfil, Opinion




urlpatterns = [
    path('Perfil_Paciente/',Perfil.as_view(), name = 'perfil'),
    path('Opinion_Paciente/',Opinion.as_view(), name = 'opinion'),

]
