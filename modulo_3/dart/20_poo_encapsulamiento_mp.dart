class Refugio {
  final String nombre;
  int _capacidadMaxima;
  int _mascotasActuales;  // privado — nadie lo modifica directamente

  Refugio(this.nombre, this._capacidadMaxima)
      : _mascotasActuales = 0;

  // Getters — lectura permitida, escritura no
  int get capacidadMaxima   => _capacidadMaxima;
  int get mascotasActuales  => _mascotasActuales;
  int get lugaresDisponibles => _capacidadMaxima - _mascotasActuales;

  // Los únicos caminos para modificar _mascotasActuales
  void ingresarMascota(String nombreMascota) {
    if (_mascotasActuales >= _capacidadMaxima) {
      throw StateError('El refugio está lleno');
    }
    _mascotasActuales++;
    print('$nombreMascota ingresó. Ocupación: $_mascotasActuales/$_capacidadMaxima');
  }

  void adoptarMascota(String nombreMascota) {
    if (_mascotasActuales <= 0) throw StateError('No hay mascotas en el refugio');
    _mascotasActuales--;
    print('$nombreMascota fue adoptada. Ocupación: $_mascotasActuales/$_capacidadMaxima');
  }
}

void main() {
  final refugio = Refugio('Patitas Felices', 5);

  refugio.ingresarMascota('Luna');   // Luna ingresó. Ocupación: 1/5
  refugio.ingresarMascota('Toby');   // Toby ingresó. Ocupación: 2/5
  refugio.adoptarMascota('Luna');    // Luna fue adoptada. Ocupación: 1/5
  print(refugio.lugaresDisponibles); // 4

  // refugio._mascotasActuales = 99;  // ERROR — privado, Dart no lo permite
}
