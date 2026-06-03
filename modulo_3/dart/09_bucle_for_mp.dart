void main() {
  // for con índice — cuando necesitas el número de iteración
  for (int i = 0; i < 5; i++) {
    print('Revisando solicitud de adopción #$i');
  }

  // for con paso distinto
  for (int i = 0; i <= 100; i += 25) {
    print('Proceso de adopción: $i% completado');
  }

  // for decreciente — cuenta regresiva para el día de entrega
  for (int i = 5; i >= 1; i--) {
    print('Faltan $i días para recoger a tu mascota');
  }
}
