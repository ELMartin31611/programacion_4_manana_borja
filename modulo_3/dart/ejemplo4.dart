import 'dart:io';

void main() {

  int cajas;
  int total = 0;
  int empleados = 0;
  double promedio = 0;

  // Primer ingreso
  print("Ingrese la cantidad de cajas empacadas (0 para salir): ");
  cajas = int.parse(stdin.readLineSync()!);

  // Ciclo while
  while (cajas > 0) {

    empleados++; // contar empleado

    // Evaluación
    if (cajas < 20) {
      print("Rendimiento bajo");
    } else if (cajas <= 50) {
      print("Rendimiento normal");
    } else {
      print("Rendimiento excelente");
    }

    total += cajas;

    // Siguiente ingreso
    print("\nIngrese la cantidad de cajas empacadas (0 para salir): ");
    cajas = int.parse(stdin.readLineSync()!);
  }

  // Calcular promedio
  if (empleados > 0) {
    promedio = total / empleados;
  }

  // Resultados finales
  print("\n----- RESULTADOS -----");
  print("Total de cajas empacadas: $total");
  print("Cantidad de empleados: $empleados");
  print("Promedio de cajas por empleado: ${promedio.toStringAsFixed(2)}");
}