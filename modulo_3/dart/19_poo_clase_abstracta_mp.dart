// abstract class define el contrato — QUÉ puede hacer cualquier Animal
abstract class Animal {
  String get nombre;
  String get especie;
  String hacerSonido();        // cada animal lo implementa a su manera
  String describirCuidados();

  // Método concreto construido sobre la abstracción
  void presentarFicha() {
    print('$especie "$nombre" — sonido: ${hacerSonido()}, '
          'cuidados: ${describirCuidados()}');
  }
}

// Implementaciones concretas — el CÓMO es específico de cada clase
class Perro extends Animal {
  final String _nombre;
  Perro(this._nombre);

  @override String get nombre  => _nombre;
  @override String get especie => 'Perro';
  @override String hacerSonido()       => '¡Guau!';
  @override String describirCuidados() => 'Paseos diarios y mucho cariño';
}

class Gato extends Animal {
  final String _nombre;
  Gato(this._nombre);

  @override String get nombre  => _nombre;
  @override String get especie => 'Gato';
  @override String hacerSonido()       => '¡Miau!';
  @override String describirCuidados() => 'Juguetes y arenero limpio';
}

void main() {
  final animales = <Animal>[Perro('Rocky'), Gato('Misi')];
  for (final a in animales) {
    a.presentarFicha();  // no importa qué tipo de Animal es
  }
}
