from django import forms
from django.utils.translation import ugettext_lazy as _
from Apps.Autenticacion.models import Paciente
from Apps.Principal.models import OpinionesClientes

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

class PacienteForm(forms.ModelForm):
    class Meta:
        model = Paciente
        fields = "__all__"
        exclude = ('usuid','cuidador_id','correo')
        labels = {
            #'cuidador_id': _(u''),
            #'correo': (u''),
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
