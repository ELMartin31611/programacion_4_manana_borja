import 'dart:io';

void main (){
    int horas = 0;
    int sillas = 0;
    int empleados=0;
    double promedio = 0.0;
    int total=0;
    double prom = 0.0;
    double totalhoras = 0.0;

    print('ingresar horas de trabajos (0 apra salir):');
    horas = int.parse(stdin.readLineSync()!);

    print('ingresar la siilas hechas:');
    sillas = int.parse(stdin.readLineSync()!);


    

    while (horas != 0){

        empleados ++;

        if (sillas < 2){
            print("produccion baja");
        } else if (sillas >= 2 &&  sillas <=4 ){
            print("Producion normal");
        }else{
            print("produccion alta");
        }


        total+=sillas;
        totalhoras+= horas;

        print('ingresar horas de trabajos (0 apra salir):');
        horas = int.parse(stdin.readLineSync()!);

        print('ingresar la siilas hechas:');
        sillas = int.parse(stdin.readLineSync()!);

    }

    prom = total / totalhoras;
    promedio = total/ empleados;

    print("Total de sillas hechas: $total");
    print("cantidad de empleados registrados: $empleados");
    print("promedio de sillas hechas por empleado: $promedio");
    print("promedio de sillas hechas por  hora : $prom");








}