from django.urls import path
from .views import Login

urlpatterns = [
    path('',Login.as_view(), name = 'login'),
    path('logout/',Login.as_view(), name = 'logout'),
]
