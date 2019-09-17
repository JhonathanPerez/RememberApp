from django.shortcuts import render
from django.views.generic import TemplateView, ListView
from .models import Principal,RedesSociales,Web
from .utils import *


class Inicio(ListView):

    def get(self,request,*args,**kwargs):

        contexto = {
            'principal':obtenerPrincipal(),
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes': obtenerRedes(),
            'web':obtenerWeb(),
        }

        return render(request,'index.html',contexto)
