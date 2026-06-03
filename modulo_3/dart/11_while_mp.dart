void main() {
  // while — comprueba la condición ANTES de ejecutar
  int mascotasEnRefugio = 10;
  int mascotasAdoptadas = 0;

  while (mascotasEnRefugio > 0) {
    final lote = mascotasEnRefugio > 3 ? 3 : mascotasEnRefugio;
    mascotasAdoptadas += lote;
    mascotasEnRefugio -= lote;
    print('Adoptadas este turno: $lote (quedan: $mascotasEnRefugio)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ antes de comprobar
  int intentos = 0;
  bool solicitudAprobada = false;

  do {
    intentos++;
    print('Revisando solicitud de adopción #$intentos...');
    // Simula que se aprueba en el 3er intento
    if (intentos == 3) solicitudAprobada = true;
  } while (!solicitudAprobada && intentos < 5);

  print(solicitudAprobada
      ? 'Solicitud aprobada tras $intentos intentos'
      : 'No se pudo aprobar la solicitud');
}
