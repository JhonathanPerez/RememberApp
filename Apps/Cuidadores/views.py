from django.shortcuts import render
from django.views.generic.base import View, TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from .forms import DatosPersonalesForm, OpinionesForm, RegistroPacienteForm
from Apps.Autenticacion.models import DatosPersonales, UsuarioRol, Vinculaciones
from Apps.Principal.models import OpinionesClientes



class Perfil(LoginRequiredMixin, View):
    login_url = '/login'
    form_class = DatosPersonalesForm
    template_name = 'perfil_cuidador.html'

    def get(self, request):
        try:
            datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
            form = self.form_class(request.user, instance=datos_usuario)
            return render(request,
                          self.template_name,
                          {'form': form,
                           'foto_usuario': datos_usuario.foto,
                           'user': datos_usuario,
                           })

        except DatosPersonales.DoesNotExist:
            return render(request, "pages-404.html")

    def post(self, request):
        try:
            datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
            form = self.form_class(request.user, request.POST, request.FILES, instance=datos_usuario)

            if form.is_valid():
                form.save()
                messages.add_message(request, messages.INFO, 'El Perfil se modificó correctamente')

            else:
                messages.add_message(request, messages.ERROR, 'El Perfil no se pudo modificar')

            return self.get(request)

        except DatosPersonales.DoesNotExist:
            return render(request, "pages-404.html")


class Opinion(LoginRequiredMixin, View):
        form_class = OpinionesForm

        def get(self,request,*args,**kwargs):
            form = OpinionesForm()
            datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
            contexto = {
                'form':form,
                 'foto_usuario': datos_usuario.foto,
                 'user': datos_usuario,
            }

            return render(request,'opiniones_cuidador.html',contexto)

        def post(self, request):
            form = OpinionesForm(request.POST)
            datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
            if form.is_valid():
                usuario = datos_usuario.nombre
                lista_roles = UsuarioRol.objects.filter(usuid=request.user.pk)
                rol = lista_roles[0].rolid.roltipo
                foto = datos_usuario.foto
                mensaje_cuidador = request.POST.get("mensaje",)
                consulta = OpinionesClientes(usuario=usuario,imagen_usuario=foto,rol=rol,mensaje=mensaje_cuidador)
                consulta.save()
                form = OpinionesForm()
                mensaje = messages.add_message(request, messages.SUCCESS, "Se ha registrado tu opinión exitosamente!")
                contexto = {
                    'form':form,
                     'foto_usuario': datos_usuario.foto,
                     'user': datos_usuario,
                }

                return render(request,'opiniones_cuidador.html',contexto)



class RegistroPaciente(LoginRequiredMixin, View):
    form_class = RegistroPacienteForm
    def get(self,request,*args,**kwargs):
        datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
        form = self.form_class(datos_usuario.pk)
        contexto = {

            'form':form,
            'foto_usuario': datos_usuario.foto,
            'user': datos_usuario,
        }

        return render(request,'registro_paciente.html',contexto)

    def post(self,request,*args,**kwargs):
        datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
        form = self.form_class(datos_usuario, request.POST, request.FILES)
        if form.is_valid():
            form.save()
            nombre_paciente = request.POST.get("nombre",)
            apellido_paciente = request.POST.get("apellido",)
            datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
            vincular = Vinculaciones(nombre=nombre_paciente,apellido=apellido_paciente,cuidador_id=request.user.pk)
            vincular.save()
            form = RegistroPacienteForm()
            mensaje = messages.add_message(request, messages.SUCCESS, "EL paciente se ha registrado con exito, recibira un correo con el usuario y contraseña de acceso!")
            contexto = {
                'mensaje':mensaje,
                'form':form,
                'foto_usuario': datos_usuario.foto,
                'user': datos_usuario,
            }

            return render(request,'registro_paciente.html',contexto)
        else:
            mensaje = messages.add_message(request, messages.ERROR, "Algo salió mal, verifica los datos.")
            datos_usuario = DatosPersonales.objects.get(usuid=request.user.pk)
            contexto = {
                'form':form,
                'mensaje':mensaje,
                'foto_usuario': datos_usuario.foto,
                'user': datos_usuario,
            }
            return render(request,'registro_paciente.html',contexto)


class ListaPaciente(LoginRequiredMixin, View):

    def get(self,request,*args,**kwargs):
        contexto = {
            'foto_usuario': datos_usuario.foto,
            'user': datos_usuario,
        }

        return render(request,'lista_pacientes.html',contexto)
