from django.shortcuts import render, redirect
from django.contrib import messages
from django.views.generic import TemplateView, ListView
from .models import Principal,RedesSociales,Web
from .utils import *
from .forms import ContactoForm


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


class Nosotros(ListView):
    def get(self,request,*args,**kwargs):

        contexto = {
            'principal':obtenerPrincipal(),
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes': obtenerRedes(),
            'web':obtenerWeb(),
            'desarrolladores':obtenerDesarrolladores(),
        }

        return render(request,'nosotros.html',contexto)


class Servicios(ListView):
    def get(self,request,*args,**kwargs):

        contexto = {
            'principal':obtenerPrincipal(),
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes': obtenerRedes(),
            'web':obtenerWeb(),
        }

        return render(request,'servicios.html',contexto)


class Contacto(ListView):
    def get(self,request,*args,**kwargs):
        form = ContactoForm()
        contexto = {
            'principal':obtenerPrincipal(),
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes': obtenerRedes(),
            'web':obtenerWeb(),
            'form':form,
        }

        return render(request,'contacto.html',contexto)

    def post(self,request,*args,**kwargs):
        form = ContactoForm(request.POST)
        if form.is_valid():
            form.save()
            mensaje = messages.add_message(request, messages.INFO, "Gracias por contactarnos!")
            contexto = {
                'principal':obtenerPrincipal(),
                'servicios':obtenerServicios(),
                'opiniones':obtenerOpiniones(),
                'redes': obtenerRedes(),
                'web':obtenerWeb(),
                'mensaje':mensaje,
            }

            return render(request,'index.html',contexto)
        else:
            mensaje = messages.add_message(request, messages.ERROR, "Ops! algo salió mal, verifica los datos.")
            contexto = {
                'principal':obtenerPrincipal(),
                'servicios':obtenerServicios(),
                'opiniones':obtenerOpiniones(),
                'redes': obtenerRedes(),
                'web':obtenerWeb(),
                'form':form,
                'mensaje':mensaje,
            }
            return render(request,'contacto.html',contexto)
