void main() {
  final mascotas = ['Luna', 'Toby', 'Misi', 'Rocky', 'Nala'];

  // for-in — la forma idiomática para recorrer listas
  for (final mascota in mascotas) {
    print(mascota);
  }

  // forEach con lambda — alternativa funcional
  mascotas.forEach((m) => print(m.toLowerCase()));

  // for-in sobre un Map
  final vacunas = {'Luna': 'rabia', 'Toby': 'moquillo', 'Misi': 'panleucopenia'};
  for (final entrada in vacunas.entries) {
    print('${entrada.key} → vacuna: ${entrada.value}');
  }

  // for-in sobre caracteres de un String
  for (final caracter in 'Luna') {
    print(caracter);
  }
}
