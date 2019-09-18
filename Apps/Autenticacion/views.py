from django.shortcuts import render
from django.views.generic import ListView,TemplateView
from django.contrib import auth
from django.contrib import messages
from .models import UsuarioRol
from django.http import HttpResponseRedirect
from django.urls import reverse
from .utils import *


class Login(ListView):

    def get(self,request,*args,**kwargs):
        contexto = {
            'redes':obtenerRedes(),
            'web':obtenerWeb(),
        }
        return render(request,'login.html', contexto)


    def post(self, request):
        username = request.POST.get("username",)
        password = request.POST.get("password",)
        usuario = auth.authenticate(username=username,
                                    password=password)

        if usuario != None and usuario.is_active:
            auth.login(request, usuario)
            lista_roles = UsuarioRol.objects.filter(usuid=usuario.pk)

            if len(lista_roles) > 0:
                if lista_roles[0].rolid.roltipo == "Cuidador":
                    return HttpResponseRedirect(reverse('principal:index'))

                elif lista_roles[0].rolid.roltipo == "Paciente":
                    return HttpResponseRedirect(reverse('principal:nosotros'))

                else:
                    messages.add_message(request, messages.ERROR, "Rol de usuario inexistente")

            else:
                messages.add_message(request, messages.ERROR, "El Usuario no tiene roles asignados")

        else:
            if usuario == None:
                messages.add_message(request, messages.ERROR, "El Usuario no existe en el Sistema")

            else:
                messages.add_message(request, messages.ERROR, "El Usuario esta inactivo")

        return render(request, 'login.html')
