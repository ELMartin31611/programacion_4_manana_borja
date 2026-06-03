void main() {
  // Lambda asignada a una variable
  final calcularEdadHumana = (int edadMeses) => edadMeses * 7;
  print(calcularEdadHumana(12));  // 84 (equivalente en años humanos)

  // Lambda de cuerpo completo
  final calcularCostoAdopcion = (double cuotaBase, double descuento) {
    final ahorro = cuotaBase * (descuento / 100);
    return cuotaBase - ahorro;
  };
  print(calcularCostoAdopcion(80.0, 20.0));  // 64.0

  // Lambda en línea — pasada directamente como argumento
  final edadesMeses = [8, 2, 36, 14, 5, 48, 1, 22];
  edadesMeses.sort((a, b) => b.compareTo(a));  // orden descendente
  print(edadesMeses);  // [48, 36, 22, 14, 8, 5, 2, 1]
}
