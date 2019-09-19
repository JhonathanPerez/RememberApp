from django.urls import path
from .views import Inicio,DetallePost,Listado

urlpatterns = [
    path('blog/',Inicio.as_view(), name = 'index'),
    path('tratamientos/',Listado.as_view(),{'nombre_categoria':'tratamientos'}, name = 'tratamientos'),
    path('generales/',Listado.as_view(),{'nombre_categoria':'General'}, name = 'generales'),
    path('<slug:slug>/',DetallePost.as_view(), name = 'detalle_post'),
]
