fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo While")


    println("While básico")
    var contador = 1
    while (contador <= 5) {
        println(contador)
        contador++
    }


    println("Do While")
    contador = 1
    do {
        println(contador)
        contador++
    } while (contador <= 5)

  
    println("Break y Continue")
    contador = 1
    while (contador <= 10) {
        contador++
        if (contador == 3) continue
        if (contador == 7) break
        println(contador)
    }

  
    var input: String
    while (true) {
        println("Escribe 'salir' para terminar:")
        input = readLine() ?: ""

        if (input.lowercase() == "salir") break

        println("Usted ingresó: $input")
    }
    
    
    fun main() {
    var opcion: Int

    do {
        
        println("1. Saludar")
        println("2. Sumar")
        println("3. Tabla de multiplicar")
        println("4. Salir")
        print("Seleccione una opción: ")

        opcion = readLine()?.toIntOrNull() ?: 0

        when (opcion) {
            1 -> {
                print("Ingrese su nombre: ")
                val nombre = readLine() ?: ""
                println("Hola, $nombre")
            }
            2 -> {
                print("Ingrese el primer número: ")
                val num1 = readLine()?.toDoubleOrNull() ?: 0.0
                print("Ingrese el segundo número: ")
                val num2 = readLine()?.toDoubleOrNull() ?: 0.0
                println("La suma es: ${num1 + num2}")
            }
            3 -> {
                print("Ingrese un número para la tabla: ")
                val num = readLine()?.toIntOrNull() ?: 0
                println("Tabla del $num:")
                for (i in 1..10) {
                    println("$num x $i = ${num * i}")
                }
            }
            4 -> {
                println("Saliendo del programa...")
            }
            else -> {
                println("Opción inválida, intente nuevamente.")
            }
        }
    } while (opcion != 4)
}



    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat")
    println("Cuantas pulsaciones tomar para calcular frecuencia cardiaca")
    
    val mediciones = readLine()?.toIntOrNull() ?: 0
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("medicion ${i + 1} (pulsos en 15 seg.)")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4//para 60 segs.
    }

    if (mediciones > 0) {
        val promedio = totalPulsaciones / mediciones
        println("Frecuencia cardiaca promedio: $promedio lpm")
        println("Clasificacion: ${
            when {
                promedio < 60 -> "Bradicardia"
                promedio <= 100 -> "Normal"
                else -> "Taquicardia"
            }
        }")
    } else {
        println("No se ingresaron mediciones válidas.")
    }



    println("Controles de flujo Iteraciones, ciclos repetitivos - ciclo repeat")
    println("Se tomarán 6 mediciones de temperatura")

    var totalTemperatura = 0.0
    val mediciones = 6
    var fiebre = 0

    repeat(mediciones) { i ->
        println("Medición ${i + 1} (°C):")
        val temperatura = readLine()?.toDoubleOrNull() ?: 0.0
        totalTemperatura += temperatura

        if (temperatura >= 38.5) {
            fiebre++
        }
    }

    val promedio = totalTemperatura / mediciones

    println("Promedio de temperatura:$promedio")

    if (fiebre >= 2) {
        println("Si hubo fiebre sostenida")
    } else {
        println("No hubo fiebre sostenida")
    }
}

    
