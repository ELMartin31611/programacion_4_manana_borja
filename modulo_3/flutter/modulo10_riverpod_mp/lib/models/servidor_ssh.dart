// lib/models/servidor_ssh.dart
class Mascota {
  final String id;
  final String nombre;
  final String chip;
  final int    edad;
  final bool   vacunado;
  bool         favorito;

  Mascota({
    required this.id,
    required this.nombre,
    required this.chip,
    required this.edad,
    required this.vacunado,
    this.favorito = false,
  });
}
