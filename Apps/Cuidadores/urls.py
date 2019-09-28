from django.urls import path
from .views import Perfil, Opinion, RegistroPaciente



urlpatterns = [
    path('Perfil_Cuidador/',Perfil.as_view(), name = 'perfil'),
    path('Opinion_Cuidador/',Opinion.as_view(), name = 'opinion'),
    path('Registro_Paciente/',RegistroPaciente.as_view(), name = 'registro_paciente'),

]
