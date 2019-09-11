from django.shortcuts import render
from django.views.generic import ListView,TemplateView
from .utils import *


class Login(ListView):

    def get(self,request,*args,**kwargs):
        contexto = {
            'redes':obtenerRedes(),
            'web':obtenerWeb(),
        }
        return render(request,'login.html', contexto)
