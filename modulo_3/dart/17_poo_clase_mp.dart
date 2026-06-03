class Mascota {
  // 1. Propiedades
  final String id;
  final String nombre;
  String       especie;
  bool         _adoptada = false;  // _ indica uso interno

  // 2. Constructor nombrado con parámetros nombrados
  Mascota({
    required this.id,
    required this.nombre,
    required this.especie,
  });

  // 3. Getter — propiedad derivada, solo lectura
  bool   get adoptada => _adoptada;
  String get estado   => _adoptada ? 'adoptada' : 'disponible';

  // 4. Setter — escritura controlada
  set estadoAdopcion(bool valor) {
    _adoptada = valor;
    print('$nombre: ${valor ? "adoptada" : "de vuelta en el refugio"}');
  }

  // 5. Métodos
  void registrar() {
    print('$nombre registrada en el sistema — ID: $id');
  }

  void devolver() {
    _adoptada = false;
    print('$nombre ha sido devuelta al refugio');
  }

  String resumen() => 'ID: $id | Nombre: $nombre | Especie: $especie | Estado: $estado';

  // 6. toString
  @override
  String toString() => 'Mascota($nombre, $especie, $estado)';
}

void main() {
  // Crear una instancia
  final luna = Mascota(
    id:      'MSC-001',
    nombre:  'Luna',
    especie: 'perro',
  );

  // Usar sus métodos y propiedades
  luna.registrar();
  print(luna.estado);       // disponible
  print(luna.resumen());
  print(luna);              // llama toString() automáticamente

  luna.estadoAdopcion = true;   // usa el setter
  print(luna.adoptada);         // true
}
