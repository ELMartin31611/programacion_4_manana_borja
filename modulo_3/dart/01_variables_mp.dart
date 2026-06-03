void main() {
  // Tipo no-nullable — NUNCA puede ser null
  String nombreMascota = 'Luna';
  // nombreMascota = null;       // ERROR de compilación

  // Tipo nullable — puede ser null (añadir ?)
  String? raza = null;   // OK
  raza = 'Labrador';     // OK

  // Operadores de null safety
  String? refugio = 'Refugio Esperanza';

  // ?. — safe call (igual que en Kotlin)
  print(refugio?.length);      // no lanza excepción

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = refugio ?? 'Sin refugio';
  print(resultado);            // Sin refugio

  // ! — non-null assertion (igual que !! en Kotlin) — úsalo con precaución
  String refugioSeguro = refugio!;  // lanza si refugio es null

  // Null check con if
  if (raza != null) {
    print(raza.length);   // smart cast — ya es String aquí
  }

  // late — inicialización diferida (como lateinit en Kotlin)
  late String codigoAdopcion;
  codigoAdopcion = 'ADO-2024';   // debe asignarse antes de usar
  print(codigoAdopcion);
}
