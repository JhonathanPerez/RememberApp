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
        form = SubscriptorForm(request.POST)
        correo_subs = request.POST.get('subemail')

        query = Subscriptor.objects.filter(subemail = correo_subs)

        if len(query) == 0:
            verifica = None

        else:
            verifica = 1


        if verifica == None:
            if form.is_valid():
                correo = request.POST.get('subemail')
                Subscriptor.objects.create(subemail = correo)
                asunto = 'GRACIAS POR SUSCRIBIRTE!'
                contenido = 'Te haz suscrito exitosamente a nuestras actualizaciones, te estaremos enviando por este medio todas nuestras novedades!'
                suscriptor = messages.add_message(request, messages.INFO, "Se ha registrado tu correo en nuestra base de datos.")
                try:
                    send_mail(asunto,contenido,EMAIL_HOST_USER,[correo])
                except:
                    pass

                return redirect('principal:index')
            else:
                suscriptor = messages.add_message(request, messages.ERROR, "Verifica el correo ingresado.")
                return redirect('principal:index')

        else:
            suscriptor = messages.add_message(request, messages.WARNING, "Ya estas registrado en nuestra base de datos")
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
            form = ContactoForm()
            subs_form =  SubscriptorForm()
            mensaje = messages.add_message(request, messages.SUCCESS, "Se ha registrado tu solicitud")
            contexto = {
                'mensaje':mensaje,
                'form':form,
            }

            return render(request,'contacto.html',contexto)
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
