import 'dart:io';

void main (){

    print ('Ingrese la nota: ');

    int nota = int.parse(stdin.readLineSync()!);

    if (nota >= 7){
        print("usted ha aprovado");
    }else {
        print("usted ha reprobado");
    }
}

