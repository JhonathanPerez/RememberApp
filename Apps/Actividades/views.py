from django.shortcuts import render
from django.views.generic import TemplateView
from django.contrib import messages



class Concentrate(TemplateView):
    template_name = 'concentrate.html'
