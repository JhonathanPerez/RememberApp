from .models import RedesSociales,Web, OpinionesClientes, Servicios, Principal, Desarrollador


def obtenerPrincipal():
    return Principal.objects.filter(estado = True).latest('fecha_creacion')

def obtenerRedes():
    return RedesSociales.objects.filter(estado = True).latest('fecha_creacion')

def obtenerWeb():
    return Web.objects.filter(estado = True).latest('fecha_creacion')

def obtenerOpiniones():
    return OpinionesClientes.objects.filter(estado = True)

def obtenerServicios():
    return Servicios.objects.filter(estado = True)

def obtenerDesarrolladores():
    return Desarrollador.objects.filter(estado = True)
