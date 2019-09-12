from django.shortcuts import render
from django.views.generic import TemplateView, ListView
from .models import Principal,RedesSociales,Web
from .utils import *


class Inicio(ListView):

    def get(self,request,*args,**kwargs):

        try:
            principal = obtenerPrincipal()

        except:
         principal = None

         try:
             redes = obtenerRedes()

         except:
             redes = None

        try:
            web = obtenerWeb()

        except Exception:
            web = None

        contexto = {
            'principal':principal,
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes': redes,
            'web':web,
        }

        return render(request,'index.html',contexto)
