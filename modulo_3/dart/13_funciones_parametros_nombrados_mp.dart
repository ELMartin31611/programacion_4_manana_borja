// required → el parámetro es obligatorio
// sin required → es opcional (necesita valor por defecto o ser nullable)
void registrarMascota({
  required String nombre,
  required String especie,
  bool   esterilizado  = false,
  int    edadMeses     = 0,
}) {
  final estado = esterilizado ? 'esterilizado/a' : 'no esterilizado/a';
  print('Registrando: $nombre ($especie), $edadMeses meses, $estado');
}

void main() {
  // Los nombrados pueden pasarse en cualquier orden
  registrarMascota(
    nombre:       'Luna',
    especie:      'perro',
    esterilizado: true,
    edadMeses:    18,
  );

  // Solo los obligatorios — los opcionales toman su valor por defecto
  registrarMascota(
    nombre:  'Misi',
    especie: 'gato',
  );
}
