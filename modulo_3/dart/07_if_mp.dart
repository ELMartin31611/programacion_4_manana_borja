void main() {
  // Forma básica
  int edadMeses = 8;

  if (edadMeses < 6) {
    print('Cachorro muy joven');
  } else if (edadMeses < 24) {
    print('Cachorro joven');
  } else {
    print('Adulto');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String etapa = edadMeses < 12 ? 'Cachorro' : 'Adulto';
  print(etapa);

  // null-aware con ternario
  String? raza;
  String display = raza != null ? raza.toUpperCase() : 'Raza desconocida';

  // Forma más concisa con ??
  String display2 = raza?.toUpperCase() ?? 'Raza desconocida';
  print(display2);  // Raza desconocida

  String? nombreAdoptante;

  // Sin verificar — error de compilación
  // print(nombreAdoptante.length);  // ERROR: puede ser null

  // Forma 1 — verificación explícita
  if (nombreAdoptante != null) {
    print(nombreAdoptante.length);  // Dart sabe que es String
  }

  // Forma 2 — operador ?.
  print(nombreAdoptante?.length);  // null, sin excepción

  // Forma 3 — valor por defecto
  int longitud = nombreAdoptante?.length ?? 0;
  print(longitud);  // 0
}
