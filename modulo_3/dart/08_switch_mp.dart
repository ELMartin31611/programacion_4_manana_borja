void main() {
  String estadoAdopcion = 'aprobada';

  switch (estadoAdopcion) {
    case 'pendiente':
      print('Solicitud en revisión');
    case 'aprobada':
      print('Adopción aprobada');
    case 'rechazada':
      print('Solicitud rechazada');
    case 'entregada':
      print('Mascota entregada al adoptante');
    case 'cancelada':
      print('Solicitud cancelada');
    default:
      print('Estado desconocido');
  }


  // Switch expresión — asigna el resultado a una variable
  String estado = 'aprobada';

  String descripcion = switch (estado) {
    'pendiente'  => 'En espera de revisión',
    'aprobada'   => 'Listo para recoger la mascota',
    'rechazada'  => 'No cumple los requisitos',
    'entregada'  => 'Proceso completado con éxito',
    'cancelada'  => 'El adoptante canceló la solicitud',
    _            => 'Estado no reconocido',
  };

  print(descripcion);  // Listo para recoger la mascota


  int edadMeses = 8;

  // Múltiples valores en una rama con ||
  String categoria = switch (edadMeses) {
    0 || 1 || 2 || 3         => 'Neonato (0-3 meses)',
    4 || 5 || 6 || 7 || 8    => 'Cachorro joven (4-8 meses)',
    9 || 10 || 11             => 'Cachorro mayor (9-11 meses)',
    _                         => 'Adulto (12+ meses)',
  };

  print(categoria);  // Cachorro joven (4-8 meses)

  // Guards — condición adicional con 'when'
  double peso = 2.3;

  String tamano = switch (peso) {
    double p when p >= 25.0 => 'Talla grande',
    double p when p >= 10.0 => 'Talla mediana',
    double p when p >= 4.0  => 'Talla pequeña',
    _                        => 'Mini (menos de 4 kg)',
  };

  print(tamano);  // Mini (menos de 4 kg)


  Object datoMascota = {'nombre': 'Luna', 'especie': 'perro', 'edad': 3};

  String resultado = switch (datoMascota) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error: ${m['error']}',
    Map<String, dynamic> m =>
        'Mascota: ${m['nombre']} — especie: ${m['especie']}',
    List<dynamic> lista =>
        '${lista.length} mascotas en el refugio',
    String texto =>
        'Nota: $texto',
    _ =>
        'Dato desconocido',
  };

  print(resultado);  // Mascota: Luna — especie: perro
}
