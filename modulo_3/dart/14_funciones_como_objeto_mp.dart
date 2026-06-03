String describirPerro(String nombre)  => '$nombre es un perro';
String describirGato(String nombre)   => '$nombre es un gato';

void main() {
  // La variable 'describir' tiene tipo: String Function(String)
  String Function(String) describir;

  describir = describirPerro;
  print(describir('Rocky'));     // Rocky es un perro

  describir = describirGato;
  print(describir('Misi'));      // Misi es un gato

  // Lista de funciones
  final descripciones = <String Function(String)>[describirPerro, describirGato];
  for (final fn in descripciones) {
    print(fn('Luna'));           // Luna es un perro, luego Luna es un gato
  }
}
