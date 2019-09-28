from Apps.Autenticacion.models import  Paciente

def obtenerPaciente(cuidador_id):
    return Paciente.objects.filter(cuidador_id = cuidador_id)
