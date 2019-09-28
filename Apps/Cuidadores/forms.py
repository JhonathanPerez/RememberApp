from django import forms
from django.utils.translation import ugettext_lazy as _
from Apps.Autenticacion.models import DatosPersonales, Paciente
from Apps.Principal.models import OpinionesClientes


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


class OpinionesForm(forms.ModelForm):
    class Meta:
        model = OpinionesClientes
        fields = 'mensaje',

        widgets = {
            'mensaje':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese su mensaje',
                }
            ),
        }

class RegistroPacienteForm(forms.ModelForm):
    class Meta:
        model = Paciente
        fields = "__all__"
        exclude = ('usuid',)
        labels = {
            'cuidador_id': _(u'')
        }
        widgets = {
            'nombre':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese el nombre del paciente',
                }
            ),

            'apellido':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese el apellido del paciente',
                }
            ),

            'genero':forms.Select(
                attrs = {
                    'class':'form-control',
                }
            ),

            'tipoid':forms.Select(
                attrs = {
                    'class':'form-control',
                }
            ),

            'numeroid':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese el número de identificación',
                }
            ),

            'telefono':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese el número de télefono',
                }
            ),

            'correo':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese su correo electronico',
                }
            ),

        }

    def __init__(self, id=None, *args, **kwargs):
            super(RegistroPacienteForm, self).__init__(*args, **kwargs)

            if id is not None:
                self.fields['cuidador_id'].widget = forms.HiddenInput()
                self.fields['cuidador_id'].initial = id

            for field in self.fields:
                self.fields[field].widget.attrs.update({'class': 'form-control'})
