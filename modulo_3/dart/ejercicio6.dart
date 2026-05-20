import 'dart:io';

void main (){

    int cajas = 0;
    int total = 0;
    int empleado = 0;
    double promedio = 0.0;


    print("ingrese la cajas de piezas de produccion (0 para salir):");
    cajas = int.parse(stdin.readLineSync()!);

    while (cajas != 0){

        empleado++;

        if(cajas < 20){
            print("Rendimiento bajo");
        }else if (cajas >= 20 && cajas <= 50 ){
            print("rendimiento normal");
        }else {
            print("Rendimiento excelente");
        }

        total+=cajas;

        print("ingrese la cajas de piezas de produccion (0 para salir):");
        cajas = int.parse(stdin.readLineSync()!);

    }


    promedio = total/ empleado;

    print("Total de cajas empacadas: $total");
    print("cantidad de empleados registrados: $empleado");
    print("promedio de cajas por empleado: $promedio");

}