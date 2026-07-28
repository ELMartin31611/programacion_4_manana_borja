class Mascota {
  final String id;
  final String nombre;
  final String chip;
  final int    edad;
  final bool   vacunado;

  const Mascota({
    required this.id,
    required this.nombre,
    required this.chip,
    required this.edad,
    required this.vacunado,
  });
}

// Lista simulada — en una app real vendría de un provider
const mascotasSimuladas = [
  Mascota(id: '1', nombre: 'luna-01',  chip: '10.0.2.10', edad: 2, vacunado: true),
  Mascota(id: '2', nombre: 'max-01',   chip: '10.0.2.20', edad: 3, vacunado: true),
  Mascota(id: '3', nombre: 'nina-ref', chip: '10.0.3.10', edad: 5, vacunado: false),
];
