fun main() {
    println("Funciones")

    val bienvenida = bienvenida()
    println(bienvenida)

    val costo: Double = calcularCostoAdopcion(50.0, 30.0)
    println(costo)

    println(calcularEdadHumana(3, 7))
    println(calcularEdadHumanaInferido(3, 7))

    saludarMascota("Firulais")
}

fun calcularCostoAdopcion(vacunas: Double, esterilizacion: Double): Double {
    return vacunas + esterilizacion
}

fun bienvenida(): String {
    return "Bienvenido al sistema de adopcion de mascotas"
}

// Tipo expresion
fun calcularEdadHumana(aniosMascota: Int, factorEspecie: Int) = aniosMascota * factorEspecie

// Tipo inferido
fun calcularEdadHumanaInferido(aniosMascota: Int, factorEspecie: Int) = aniosMascota * factorEspecie

fun saludarMascota(nombre: String) {
    println("Hola $nombre, bienvenido a tu nuevo hogar")
}
