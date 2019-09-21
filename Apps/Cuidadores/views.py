from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from .forms import DatosPersonalesForm
from Apps.Autenticacion.models import DatosPersonales


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
                           'foto_usuario': datos_usuario.foto})

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
