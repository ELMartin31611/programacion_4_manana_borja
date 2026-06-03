// Reutilizamos la jerarquía de Animal
abstract class Animal {
  String get nombre;
  String get especie;
  double calcularAlimentoDiario();  // en kg
}

class Perro extends Animal {
  final double peso;
  final String _nombre;
  Perro(this._nombre, this.peso);
  @override String get nombre  => _nombre;
  @override String get especie => 'Perro';
  @override double calcularAlimentoDiario() => peso * 0.03;
}

class Gato extends Animal {
  final double peso;
  final String _nombre;
  Gato(this._nombre, this.peso);
  @override String get nombre  => _nombre;
  @override String get especie => 'Gato';
  @override double calcularAlimentoDiario() => peso * 0.025;
}

class Conejo extends Animal {
  final double peso;
  final String _nombre;
  Conejo(this._nombre, this.peso);
  @override String get nombre  => _nombre;
  @override String get especie => 'Conejo';
  @override double calcularAlimentoDiario() => peso * 0.04;
}

// POLIMORFISMO: una sola función trabaja con cualquier Animal
void imprimirAlimento(Animal animal) {
  print('${animal.especie} ${animal.nombre}: '
        '${animal.calcularAlimentoDiario().toStringAsFixed(3)} kg/día');
}

void main() {
  final animales = <Animal>[
    Perro('Rocky', 20.0),
    Gato('Misi', 4.5),
    Conejo('Nieve', 2.0),
  ];

  // Misma llamada — comportamiento diferente según el tipo real
  for (final a in animales) {
    imprimirAlimento(a);
  }

  // Animal que más come — POLIMORFISMO con reduce
  final mayorApetito = animales.reduce(
    (a, b) => a.calcularAlimentoDiario() > b.calcularAlimentoDiario() ? a : b
  );
  print('\nAnimal que más come: ${mayorApetito.nombre} (${mayorApetito.especie})');
}
