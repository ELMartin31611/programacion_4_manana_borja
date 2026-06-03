void main() {
  final nombreMascota = 'Luna';
  final edadMeses     = 18;

  // Interpolación con $ (igual que en Kotlin)
  print('Mascota disponible: $nombreMascota');              // Mascota disponible: Luna

  // Expresión con ${ }
  print('${nombreMascota.toUpperCase()} tiene ${edadMeses ~/ 12} años y ${edadMeses % 12} meses');

  // String multilinea con triple comillas
  final ficha = '''
Nombre: $nombreMascota
Edad:   $edadMeses meses
Mayor:  ${edadMeses >= 12 ? 'Adulto' : 'Cachorro'}
  ''';
  print(ficha);

  // Raw string — ignora el escape y la interpolación
  final rutaFoto = r'C:\Refugio\Fotos\Luna.jpg';  // el \ no se interpreta
  print(rutaFoto);

  // Concatenación (menos idiomático — preferir interpolación)
  final descripcion = 'Adopta a ' + nombreMascota + ' hoy.';

  // Métodos útiles de String
  print('labrador'.toUpperCase());                 // LABRADOR
  print('  Beagle  '.trim());                      // Beagle
  print('Refugio Esperanza'.contains('Esperanza')); // true
  print('Misi'.replaceAll('i', 'I'));               // MIsI
  print('perro,gato,conejo'.split(','));             // [perro, gato, conejo]
  print('Labrador'.substring(0, 3));                // Lab
  print('Labrador'.startsWith('Lab'));              // true
  print('ADO'.padLeft(6, '0'));                     // 000ADO
  print('ADO'.padRight(6, '0'));                    // ADO000
}
