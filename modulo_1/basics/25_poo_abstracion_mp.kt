// El usuario de esta clase solo sabe que puede hacer con una mascota
// No necesita saber como se calcula costoAdopcion ni como funciona disponible

class Mascota(
    val id: Int,
    val nombre: String,
    val especie: String,
    val costoVacunas: Double,
    private val enRefugio: Boolean  // privado - el usuario no manipula esto directamente
) {
    val costoAdopcion: Double
        get() = costoVacunas * 1.10

    val disponible: Boolean
        get() = enRefugio

    override fun toString() = "$nombre ($especie - \$${"%.2f".format(costoVacunas)})"
}

fun main() {
    val firulais = Mascota(1, "Firulais", "Perro", 80.0, true)

    // El codigo externo usa la interfaz publica - no sabe el detalle interno
    println(firulais.disponible)    // true
    println(firulais.costoAdopcion) // 88.0
    // firulais.enRefugio = false   // ERROR - privado, protegido por diseno
}
