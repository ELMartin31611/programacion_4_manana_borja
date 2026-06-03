// El constructor primario integra la declaracion de propiedades
class Mascota(val nombre: String, val especie: String)

// Con cuerpo adicional
class Mascota2(val nombre: String, val edad: Int) {
    fun presentarse() = "Soy $nombre y tengo $edad anios"
    fun esCachorro() = edad <= 1
}

fun main() {
    val m = Mascota("Firulais", "Perro")
    println(m.nombre)    // Firulais
    println(m.especie)   // Perro

    val m2 = Mascota2("Mishi", 1)
    println(m2.presentarse())  // Soy Mishi y tengo 1 anios
    println(m2.esCachorro())   // true
}
