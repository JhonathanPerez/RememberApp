from django.shortcuts import render, redirect
from django.contrib import messages
from django.views.generic import TemplateView, ListView, View
from django.core.mail import send_mail
from RememberApp.settings import EMAIL_HOST_USER
from .models import Principal,RedesSociales,Web, Subscriptor
from .utils import *
from .forms import ContactoForm, SubscriptorForm


class Inicio(ListView):

    def get(self,request,*args,**kwargs):
        form = SubscriptorForm()
        contexto = {
            'principal':obtenerPrincipal(),
            'servicios':obtenerServicios(),
            'opiniones':obtenerOpiniones(),
            'redes': obtenerRedes(),
            'web':obtenerWeb(),
            'form':form,
        }

        return render(request,'index.html',contexto)


    def post(self,request,*args,**kwargs):
        correo = request.POST.get('subemail')
        Subscriptor.objects.create(subemail = correo)
        asunto = 'GRACIAS POR SUSCRIBIRTE!'
        mensaje = 'Te haz suscrito exitosamente, te estaremos enviando nuestras ultimas actualizaciones a este correo!!!'
        try:
            send_mail(asunto,mensaje,EMAIL_HOST_USER,[correo])
        except:
            pass

        return redirect('principal:index')


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
            mensaje = messages.add_message(request, messages.INFO, "Se ha registrado tu solicitud")
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
            mensaje = messages.add_message(request, messages.ERROR, "Algo salió mal, verifica los datos.")
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
