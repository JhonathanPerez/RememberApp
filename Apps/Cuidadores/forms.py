from django import forms
from django.utils.translation import ugettext_lazy as _
from Apps.Autenticacion.models import DatosPersonales

class DatosPersonalesForm(forms.ModelForm):
    class Meta:
        model = DatosPersonales
        fields = "__all__"
        labels = {
            'id': _(u'Id Usuario:'),
            'nombre': _(u'Nombre del Usuario:'),
            'apellido': _(u'Apellido del Usuario:'),
            'tipoid': _(u'Tipo del Documento:'),
            'numeroid': _(u'Número del Documento:'),
            'telefono': _(u'Número de Teléfono:'),
            'correo': _(u'Email del usuario:'),
            'foto': _(u'Foto del Usuario:'),
            'usuid': _(u''),
        }

    def __init__(self, usuario=None, *args, **kwargs):
        super(DatosPersonalesForm, self).__init__(*args, **kwargs)

        if usuario is not None:
            self.fields['usuid'].widget = forms.HiddenInput()
            self.fields['usuid'].initial = usuario

        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
