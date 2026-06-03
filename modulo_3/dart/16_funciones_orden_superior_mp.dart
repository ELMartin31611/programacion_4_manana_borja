void main() {
  final pesosMascotas = [3.5, 8.2, 1.8, 22.0];

  // map devuelve un Iterable con cada elemento transformado
  final pesosConComida = pesosMascotas.map((p) => p * 0.03); // 3% del peso al día
  print(pesosConComida.toList());
  // [0.105, 0.246, 0.054, 0.66]

  // map sobre Strings
  final nombres = ['luna', 'toby', 'misi'];
  final nombresCapitalizados = nombres.map((n) => n[0].toUpperCase() + n.substring(1));
  print(nombresCapitalizados.toList());
  // [Luna, Toby, Misi]

  final edadesMeses = [3, 14, 28, 6, 36, 9];

  final adultos = edadesMeses.where((e) => e >= 12);
  print(adultos.toList());   // [14, 28, 36]

  final cachorros = edadesMeses.where((e) => e >= 0 && e < 12);
  print(cachorros.toList()); // [3, 6, 9]
}
