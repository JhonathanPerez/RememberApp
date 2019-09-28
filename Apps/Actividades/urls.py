from django.urls import path
from .views import Concentrate

urlpatterns = [
    path('Actividad_Concentrate/',Concentrate.as_view(), name = 'concentrate'),
]
