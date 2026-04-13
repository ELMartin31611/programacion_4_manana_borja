fun main() {

    println("Operadores aritméticos en adopción de mascotas 🐾")
     
    val perros = 10
    val adoptados = 2
    
    println("Suma")
    println("$perros + $adoptados: ${perros + adoptados} (total de registro)")
    
    println("Resta")
    println("$perros - $adoptados: ${perros - adoptados} (disponibles)")
    
    println("Multiplicación")
    println("$perros * $adoptados: ${perros * adoptados}")
    
    println("División")
    println("$perros / $adoptados: ${perros / adoptados}")
    
    println("Módulo")
    println("$perros % $adoptados: ${perros % adoptados}")
    
    println("Operadores de asignación compuesta")
    
    var refugio = 10
    refugio += 5
    println("refugio += 5 $refugio (más rescates)")
    
    refugio -= 3
    println("refugio -= 3 $refugio (adopciones)")
    
    refugio *= 2
    println("refugio *= 2 $refugio (crecimiento de capacidad)")
    
    refugio /= 2
    println("refugio /= 2 $refugio")
    
    refugio %= 2
    println("refugio %= 2 $refugio")
   
   // Incremento o Decremento
   refugio++
   println("refugio++ $refugio")
   
   refugio--
   println("refugio-- $refugio")

    // Entrada de datos
    println("Número de perros nuevos:")
    val perrosNuevos = readLine()!!.toInt()

    println("Número de adopciones:")
    val adopciones = readLine()!!.toInt()
    
    println("Resultados en el refugio ")
    
    println("Suma: ${perrosNuevos + adopciones}")
    println("Resta: ${perrosNuevos - adopciones}")
    println("Multiplicación: ${perrosNuevos * adopciones}")
    println("División: ${perrosNuevos / adopciones}")
    println("Módulo: ${perrosNuevos % adopciones}")
}