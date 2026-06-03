fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo While")

    println("While basico")
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
        println("Usted ingreso: $input")
    }

    fun main() {
        var opcion: Int
        do {
            println("1. Ver mascotas disponibles")
            println("2. Registrar adopcion")
            println("3. Buscar mascota por nombre")
            println("4. Salir")
            print("Seleccione una opcion: ")

            opcion = readLine()?.toIntOrNull() ?: 0

            when (opcion) {
                1 -> {
                    println("Mascotas disponibles: Firulais, Mishi, Bugs")
                }
                2 -> {
                    print("Nombre del adoptante: ")
                    val adoptante = readLine() ?: ""
                    print("Nombre de la mascota: ")
                    val mascota = readLine() ?: ""
                    println("Adopcion registrada: $adoptante adopta a $mascota")
                }
                3 -> {
                    print("Ingrese el nombre de la mascota: ")
                    val nombre = readLine() ?: ""
                    println("Buscando mascota: $nombre")
                }
                4 -> {
                    println("Saliendo del sistema...")
                }
                else -> {
                    println("Opcion invalida, intente nuevamente.")
                }
            }
        } while (opcion != 4)
    }

    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat")
    println("Cuantas mediciones de peso tomar para la mascota")

    val mediciones = readLine()?.toIntOrNull() ?: 0
    var totalPeso = 0.0

    repeat(mediciones) { i ->
        println("Medicion ${i + 1} (kg):")
        val peso = readLine()?.toDoubleOrNull() ?: 0.0
        totalPeso += peso
    }

    if (mediciones > 0) {
        val promedio = totalPeso / mediciones
        println("Peso promedio de la mascota: ${"%.2f".format(promedio)} kg")
        println("Clasificacion: ${
            when {
                promedio < 5 -> "Mascota pequena"
                promedio <= 20 -> "Mascota mediana"
                else -> "Mascota grande"
            }
        }")
    } else {
        println("No se ingresaron mediciones validas.")
    }

    println("Ciclo repeat - control de vacunas")
    println("Se tomaran 6 registros de temperatura de la mascota")

    var totalTemperatura = 0.0
    val totalMediciones = 6
    var fiebre = 0

    repeat(totalMediciones) { i ->
        println("Medicion ${i + 1} (C):")
        val temperatura = readLine()?.toDoubleOrNull() ?: 0.0
        totalTemperatura += temperatura
        if (temperatura >= 39.5) {
            fiebre++
        }
    }

    val promedio = totalTemperatura / totalMediciones
    println("Promedio de temperatura: $promedio")

    if (fiebre >= 2) {
        println("La mascota presenta fiebre sostenida, requiere atencion veterinaria")
    } else {
        println("La mascota no presenta fiebre sostenida")
    }
}
