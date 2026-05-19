import 'dart:io';

void main () {
print('Ingresa el primer numero');
int numero = int.parse(stdin.readLineSync()!);

  if (numero >= 1) {
    print('El numero es positivo');
  } else if (numero < 0) {
    print('el numero es negativo');
  } else {
    print('el numero es cero');
  }
}