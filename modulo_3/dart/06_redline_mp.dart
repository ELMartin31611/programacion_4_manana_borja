import 'dart:io';

void main() {
    print("Ingrese el nombre de la mascota a adoptar: ");
    String? nombre = stdin.readLineSync();
    print('Solicitud de adopcion para: $nombre');

    print("Ingrese la edad en meses de la mascota: ");
    int edadMeses = int.parse(stdin.readLineSync()!);
    print('Edad: $edadMeses meses');

    print("Ingrese el peso de la mascota en kg: ");
    double peso = double.parse(stdin.readLineSync()!);
    print('Peso: $peso kg');

    print('Ingrese el numero de mascotas que ya tiene en casa: ');
    int mascotasEnCasa = int.parse(stdin.readLineSync()!);

    print('Ingrese el limite de mascotas permitidas en su vivienda: ');
    int limiteMascotas = int.parse(stdin.readLineSync()!);

    int disponibles = limiteMascotas - mascotasEnCasa;

    print('Puede adoptar $disponibles mascota(s) mas.');
}
