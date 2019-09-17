from django.shortcuts import render, redirect
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
            return redirect('principal:index')
        else:
            contexto = {
                'form':form,
            }
            return render(request,'contacto.html',contexto)
