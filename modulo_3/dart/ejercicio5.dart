import 'dart:io';

void main() {
  int piezas;
  int total = 0;

  print('Ingrese la cantidad de piezas producidas (0 para salir):');
  piezas = int.parse(stdin.readLineSync()!);

  while (piezas != 0) {

    if (piezas < 50) {
      print('Producción baja');
    } else {
      print('Producción adecuada');
    }

    total += piezas;

    print('Ingrese la cantidad de piezas producidas (0 para salir):');
    piezas = int.parse(stdin.readLineSync()!);
    
  }

  print('Total de piezas producidas: $total');
}