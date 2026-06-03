// Función sin parámetro
void bienvenida() {
  print('Bienvenido al sistema de adopción de mascotas');
}

// Función sin parámetros con retorno
int totalMascotas() {
  return 15 + 8;
}

// Sintaxis completa — preferida para funciones públicas
int calcularEdadEnMeses(int anios, int meses) {
  return anios * 12 + meses;
}

// Sintaxis de flecha — cuando el cuerpo es una sola expresión
String etapaMascota(int edadMeses) => edadMeses < 12 ? 'Cachorro' : 'Adulto';

// void — cuando no se devuelve nada
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

// Con tipo explícito — recomendado
String formatearFicha(String nombre, String raza) => 'Mascota: $nombre | Raza: $raza';

// Sin tipo — Dart infiere que retorna String
formatearFichaSinTipo(String nombre, String raza) => 'Mascota: $nombre | Raza: $raza';

// El tercer parámetro es opcional — puede omitirse al llamar
String construirPerfil(String nombre, String especie, [String? color]) {
  if (color != null) {
    return '$nombre ($especie, color $color)';
  }
  return '$nombre ($especie)';
}

// Con valor por defecto — evita el chequeo de null
String construirPerfilV2(String nombre, String especie, [String color = 'desconocido']) {
  return '$nombre ($especie, color $color)';
}


void main() {
  bienvenida();                              // Bienvenido al sistema...
  print(totalMascotas());                    // 23
  print(calcularEdadEnMeses(1, 3));          // 15
  print(etapaMascota(8));                    // Cachorro
  imprimirSeparador('Mascotas disponibles'); // ─── Mascotas disponibles ───

  print(formatearFicha('Luna', 'Labrador'));
  print(formatearFichaSinTipo('Misi', 'Persa'));

  print(construirPerfil('Rocky', 'perro'));                    // Rocky (perro)
  print(construirPerfil('Rocky', 'perro', 'marrón'));          // Rocky (perro, color marrón)
  print(construirPerfilV2('Nala', 'gato'));                    // Nala (gato, color desconocido)
}
