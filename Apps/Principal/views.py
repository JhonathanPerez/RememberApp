from django.shortcuts import render
from django.views.generic import TemplateView, ListView
from .models import Principal,RedesSociales,Web
from .utils import *


class Inicio(ListView):

    def get(self,request,*args,**kwargs):

        try:
            principal = Principal.objects.filter(
                             estado = True,
                             ).latest('fecha_creacion')

        except:
         principal = None

        contexto = {
            'principal':principal,
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes':obtenerRedes(),
            'web':obtenerWeb(),
        }

        return render(request,'index.html',contexto)
