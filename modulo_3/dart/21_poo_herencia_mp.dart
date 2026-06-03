// Clase base — comportamiento y datos comunes
class Animal {
  final String nombre;
  final int    edadMeses;

  Animal(this.nombre, this.edadMeses);

  // Método que cada subclase debe especializar
  String hacerSonido() => '...';

  // Método común — reutilizado sin cambios por todas las subclases
  void presentarse() {
    print('Soy $nombre, tengo $edadMeses meses y hago: ${hacerSonido()}');
  }
}

// HERENCIA: Perro y Gato reutilizan Animal y lo especializan
class Perro extends Animal {
  Perro(super.nombre, super.edadMeses);

  @override
  String hacerSonido() => '¡Guau!';

  void traerJuguete() => print('$nombre trae su juguete favorito 🎾');
}

class Gato extends Animal {
  Gato(super.nombre, super.edadMeses);

  @override
  String hacerSonido() => '¡Miau!';

  void ronronear() => print('$nombre ronronea felizmente 😻');
}

void main() {
  final perro = Perro('Rocky', 14);
  final gato  = Gato('Misi', 30);

  perro.presentarse();    // Soy Rocky, tengo 14 meses y hago: ¡Guau!
  gato.presentarse();     // Soy Misi, tengo 30 meses y hago: ¡Miau!

  perro.traerJuguete();
  gato.ronronear();
}
