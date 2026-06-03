fun main() {
    println("Controles de Flujo Iteraciones - Ciclos For")

    println("For con rango")
    for (i in 1..5) {
        println(i)
    }

    for (i in 1..10) {
        println("$i mascotas adoptadas en el mes $i")
    }

    println("For con until")
    for (i in 1 until 10) {
        println(i)
    }

    println("For con pasos")
    for (i in 1..10 step 3) {
        println(i)
    }

    println("For con descendente")
    for (i in 10 downTo 1) {
        println(i)
    }

    println("For con lista")
    val mascotas = listOf("Firulais", "Mishi", "Bugs")
    for (mascota in mascotas) {
        println(mascota)
    }

    println("For con lista index valor")
    for ((index, valor) in mascotas.withIndex()) {
        println("$index -> $valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
        println("mascota $i")
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 5) {
            continue
        }
        println("mascota $i")
    }

    println("For con continue y break")
    for (i in 1..10) {
        if (i == 5) continue
        if (i == 7) break
        println("mascota $i")
    }

    val refugio = listOf(
        Triple("Firulais", 2.5, "Perro"),
        Triple("Mishi", 1.2, "Gato"),
        Triple("Bugs", 0.8, "Conejo")
    )

    for ((posicion, animal) in refugio.withIndex()) {
        val (nombre, edad, especie) = animal
        val alertaEdad = if (edad < 1.0) "Cachorro" else "Adulto"
        println("Lugar $posicion - $nombre - Edad: $edad años - $especie - $alertaEdad")
    }
}
