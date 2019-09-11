from Apps.Principal.models import RedesSociales,Web

def obtenerRedes():
    return RedesSociales.objects.filter(estado = True).latest('fecha_creacion')

def obtenerWeb():
    return Web.objects.filter(estado = True).latest('fecha_creacion')
