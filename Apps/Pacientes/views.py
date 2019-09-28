from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from .forms import PacienteForm, OpinionesForm
from Apps.Autenticacion.models import Paciente, UsuarioRol
from Apps.Principal.models import OpinionesClientes


class Perfil(LoginRequiredMixin, View):
    login_url = '/login'
    form_class = PacienteForm
    template_name = 'perfil_paciente.html'

    def get(self, request):
        try:
            datos_usuario = Paciente.objects.get(usuid=request.user.pk)
            user = request.user
            form = self.form_class(instance=datos_usuario)
            return render(request,
                          self.template_name,
                          {
                           'form':form,
                           'foto_usuario': datos_usuario.foto,
                           'user': datos_usuario,
                           })

        except Paciente.DoesNotExist:
            return render(request, "pages-404.html")

    def post(self, request):
        try:
            datos_usuario = Paciente.objects.get(usuid=request.user.pk)
            form = self.form_class(request.POST, request.FILES, instance=datos_usuario)

            if form.is_valid():
                form.save()
                messages.add_message(request, messages.INFO, 'El Perfil se modificó correctamente')

            else:
                messages.add_message(request, messages.ERROR, 'El Perfil no se pudo modificar')

            return self.get(request)

        except Paciente.DoesNotExist:
            return render(request, "pages-404.html")


class Opinion(LoginRequiredMixin, View):
        form_class = OpinionesForm

        def get(self,request,*args,**kwargs):
            form = OpinionesForm()
            datos_usuario = Paciente.objects.get(usuid=request.user.pk)
            contexto = {
                'form':form,
                 'foto_usuario': datos_usuario.foto,
                 'user': datos_usuario,
            }

            return render(request,'opiniones_paciente.html',contexto)

        def post(self, request):
            form = OpinionesForm(request.POST)
            datos_usuario = Paciente.objects.get(usuid=request.user.pk)
            if form.is_valid():
                usuario = datos_usuario.nombre
                lista_roles = UsuarioRol.objects.filter(usuid=request.user.pk)
                rol = lista_roles[0].rolid.roltipo
                foto = datos_usuario.foto
                mensaje_paciente = request.POST.get("mensaje",)
                consulta = OpinionesClientes(usuario=usuario,imagen_usuario=foto,rol=rol,mensaje=mensaje_paciente)
                consulta.save()
                form = OpinionesForm()
                mensaje = messages.add_message(request, messages.SUCCESS, "Se ha registrado tu opinión exitosamente!")
                contexto = {
                    'form':form,
                     'foto_usuario': datos_usuario.foto,
                     'user': datos_usuario,
                }

                return render(request,'opiniones_paciente.html',contexto)
