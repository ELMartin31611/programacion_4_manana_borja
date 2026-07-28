class InfoMascota {
  final String       nombre;
  final String       tipo;       // 'perro', 'gato', 'conejo', 'ave'
  final String       chip;
  final bool         activo;
  final int          alertas;
  final List<String> etiquetas;

  const InfoMascota({
    required this.nombre,
    required this.tipo,
    required this.chip,
    required this.activo,
    this.alertas   = 0,
    this.etiquetas = const [],
  });
}
