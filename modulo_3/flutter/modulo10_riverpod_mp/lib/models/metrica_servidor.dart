// lib/models/metrica_servidor.dart
class EstadoMascota {
  final String mascota;
  final double energia;
  final double sociabilidad;
  final double bienestar;
  final int    interesados;

  const EstadoMascota({
    required this.mascota,
    required this.energia,
    required this.sociabilidad,
    required this.bienestar,
    required this.interesados,
  });
}
