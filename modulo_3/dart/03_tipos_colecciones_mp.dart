void main() {
  // List — lista ordenada (como List en Kotlin)
  List<String> mascotas  = ['Luna', 'Toby', 'Misi'];
  var          edades     = [2, 4, 1, 6, 3];       // tipo inferido: List<int>

  print(mascotas[0]);         // Luna
  print(mascotas.length);     // 3
  mascotas.add('Rocky');
  mascotas.remove('Toby');

  // Map — clave → valor (como Map en Kotlin)
  Map<String, String> razasMascotas = {
    'Luna':  'Labrador',
    'Misi':  'Persa',
    'Rocky': 'Bulldog',
  };

  print(razasMascotas['Luna']);   // Labrador
  print(razasMascotas['Max']);    // null — clave no existe
  razasMascotas['Nala'] = 'Siamés';  // añadir

  // Set — sin duplicados (como Set en Kotlin)
  Set<String> vacunas = {'rabia', 'moquillo', 'parvovirus'};
  vacunas.add('rabia');      // ignorado — ya existe
  print(vacunas.length);     // 3

  // Spread operator — para combinar colecciones
  var perros = ['Luna', 'Rocky'];
  var gatos  = ['Misi', 'Nala'];
  var todas  = [...perros, ...gatos];  // [Luna, Rocky, Misi, Nala]
  print(todas);

  // Collection if — elementos condicionales
  bool incluirConejos = true;
  var refugio = [
    'perros',
    'gatos',
    if (incluirConejos) 'conejos',  // solo si la condición es true
  ];

  // Collection for — generar elementos
  var ids = [for (var i = 1; i <= 5; i++) 'ADO-$i'];
  print(ids);  // [ADO-1, ADO-2, ADO-3, ADO-4, ADO-5]
}
