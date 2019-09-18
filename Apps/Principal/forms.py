from django import forms
from .models import Contacto, Subscriptor

class ContactoForm(forms.ModelForm):
    class Meta:
        model = Contacto
        fields = '__all__'
        exclude = ('estado',)

        widgets = {
            'nombre':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese su nombre',
                }
            ),
            'correo':forms.EmailInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese su correo electrónico',
                }
            ),
            'asunto':forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese el asunto',
                }
            ),
            'mensaje':forms.Textarea(
                attrs = {
                    'class':'form-control',
                    'placeholder': 'Ingrese su mensaje',
                }
            ),
        }

class SubscriptorForm(forms.ModelForm):
    class Meta:
        model = Subscriptor
        fields = '__all__'

        widgets = {
            'subemail':forms.EmailInput(
                attrs = {
                    'class':'domain-search-form',
                    'placeholder':'Ingrese su correo eléctronico',
                }
            ),
        }
