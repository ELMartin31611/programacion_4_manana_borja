fun main() {

    println("Controles de flujo When ")
    println("Ingrese código de tipo de mascota")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val tipoMascota = when (codigo) {
        1 -> "Perro "
        2 -> "Gato "
        3 -> "Conejo "
        4 -> "Ave "
        5 -> "Hamster "
        6 -> "Otro tipo de mascota "
        else -> "Tipo de mascota no registrada en el sistema "
    }

    println("Tipo de mascota: $tipoMascota")
}