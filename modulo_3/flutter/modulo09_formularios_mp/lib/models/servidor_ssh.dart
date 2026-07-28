// lib/models/servidor_ssh.dart
class Mascota {
  final String id;
  final String nombre;
  final String chip;
  final int    edad;
  final String refugio;
  final String especie;
  final String raza;
  final bool   vacunado;
  bool         favorito;    // mutable — puede cambiar sin recrear el objeto

  Mascota({
    required this.id,
    required this.nombre,
    required this.chip,
    required this.edad,
    required this.refugio,
    required this.vacunado,
    required this.raza,
    required this.especie,
    this.favorito = false,
  });
}
