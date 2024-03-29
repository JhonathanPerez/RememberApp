import random
from django.shortcuts import render,redirect
from django.views.generic import ListView,View,DetailView
from django.core.mail import send_mail
from .models import Post,Categoria
from .utils import *


class Inicio(ListView):

    def get(self,request,*args,**kwargs):
        posts = list(Post.objects.filter(
                estado = True,
                publicado = True
                ).values_list('id',flat = True))
        principal = random.choice(posts)
        posts.remove(principal)
        principal = consulta(principal)

        post1 = random.choice(posts)
        posts.remove(post1)
        post2 = random.choice(posts)
        posts.remove(post2)
        post3 = random.choice(posts)
        posts.remove(post3)
        post4 = random.choice(posts)
        posts.remove(post4)

        try:
            post_tratamientos = Post.objects.filter(
                                estado = True,
                                publicado = True,
                                categoria = Categoria.objects.get(nombre = 'tratamientos')
                                ).latest('fecha_publicacion')
        except:
            post_tratamientos = None

        try:
            post_general = Post.objects.filter(
                            estado = True,
                            publicado = True,
                            categoria = Categoria.objects.get(nombre = 'General')
                            ).latest('fecha_publicacion')
        except:
            post_general = None

        contexto = {
            'principal':principal,
            'post1': consulta(post1),
            'post2': consulta(post2),
            'post3': consulta(post3),
            'post4': consulta(post4),
            'post_general':post_general,
            'post_tratamientos':post_tratamientos,
            'sociales':obtenerRedes(),
            'web':obtenerWeb(),
        }

        return render(request,'inicio.html',contexto)


class Listado(ListView):

    def get(self,request,nombre_categoria,*args,**kwargs):
        contexto = generarCategoria(request,nombre_categoria)
        return render(request,'categoria.html',contexto)



class DetallePost(DetailView):
    def get(self,request,slug,*args,**kwargs):
        try:
            post = Post.objects.get(slug = slug)
        except:
            post = None
        posts = list(Post.objects.filter(
                estado = True,
                publicado = True
                ).values_list('id',flat = True))
        posts.remove(post.id)
        post1 = random.choice(posts)
        posts.remove(post1)
        post2 = random.choice(posts)
        posts.remove(post2)
        post3 = random.choice(posts)
        posts.remove(post3)

        contexto = {
            'post':post,
            'sociales':obtenerRedes(),
            'web':obtenerWeb(),
            'post1':consulta(post1),
            'post2':consulta(post2),
            'post3':consulta(post3),
        }
        return render(request,'post.html',contexto)
