class SolicitudAdopcion {
  final String nombreAdoptante;
  final String nombreMascota;
  final String especie;
  final bool   tieneExperiencia;

  // Constructor principal
  SolicitudAdopcion({
    required this.nombreAdoptante,
    required this.nombreMascota,
    required this.especie,
    this.tieneExperiencia = false,
  });

  // Constructor nombrado — solicitud express para gatos
  SolicitudAdopcion.gato({required this.nombreAdoptante, required this.nombreMascota})
      : especie         = 'gato',
        tieneExperiencia = false;

  // Constructor nombrado — adoptante con experiencia
  SolicitudAdopcion.adoptanteExperto({required this.nombreAdoptante, required this.nombreMascota, required this.especie})
      : tieneExperiencia = true;

  // Constructor factory — crea desde un mapa (ej: respuesta de API)
  factory SolicitudAdopcion.desdeMapa(Map<String, dynamic> datos) {
    return SolicitudAdopcion(
      nombreAdoptante:  datos['adoptante'],
      nombreMascota:    datos['mascota'],
      especie:          datos['especie'],
      tieneExperiencia: datos['experiencia'] ?? false,
    );
  }

  @override
  String toString() =>
      'Solicitud: $nombreAdoptante adopta a $nombreMascota ($especie) — Experto: $tieneExperiencia';
}

void main() {
  final s1 = SolicitudAdopcion(nombreAdoptante: 'Carlos', nombreMascota: 'Luna', especie: 'perro');
  final s2 = SolicitudAdopcion.gato(nombreAdoptante: 'María', nombreMascota: 'Misi');
  final s3 = SolicitudAdopcion.adoptanteExperto(nombreAdoptante: 'Pedro', nombreMascota: 'Rocky', especie: 'perro');
  final s4 = SolicitudAdopcion.desdeMapa({'adoptante': 'Ana', 'mascota': 'Nala', 'especie': 'gato', 'experiencia': true});

  print(s1);  // Solicitud: Carlos adopta a Luna (perro) — Experto: false
  print(s2);  // Solicitud: María adopta a Misi (gato) — Experto: false
  print(s3);  // Solicitud: Pedro adopta a Rocky (perro) — Experto: true
  print(s4);  // Solicitud: Ana adopta a Nala (gato) — Experto: true
}
