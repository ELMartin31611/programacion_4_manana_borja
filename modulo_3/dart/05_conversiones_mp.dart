void main() {
  // Conversiones numéricas
  int    edadMeses = 18;
  double edadAnios = edadMeses.toDouble() / 12;   // 1.5
  String texto     = edadMeses.toString();         // "18"

  // String → número
  int    capacidadRefugio = int.parse('50');       // 50
  double pesoMascota      = double.parse('4.75');  // 4.75

  // Conversión segura (no lanza excepción)
  int?    num1 = int.tryParse('abc');   // null — no es número
  double? num2 = double.tryParse('3.2'); // 3.2

  // Verificar tipo con is (como en Kotlin)
  Object dato = 'Labrador';
  if (dato is String) {
    print(dato.length);  // smart cast — ya es String
  }

  // Cast explícito con as
  Object obj = 'Luna';
  String nombre = obj as String;

  // Comprobar nulabilidad
  String? raza = null;
  int longitud = raza?.length ?? 0;
  print(longitud);  // 0

  // Números especiales
  print(double.infinity);     // Infinity
  print(double.nan);          // NaN
  print(double.maxFinite);    // 1.7976931348623157e+308
}
