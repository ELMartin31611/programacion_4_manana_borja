data class Mascota(
    val id: Int,
    val nombre: String,
    val especie: String,
    val edad: Double,
    val disponible: Boolean = true
)

fun main() {
    val m1 = Mascota(1, "Firulais", "Perro", 3.0)
    val m2 = Mascota(1, "Firulais", "Perro", 3.0)
    val m3 = Mascota(2, "Mishi", "Gato", 1.5)

    // toString() automatico
    println(m1)  // Mascota(id=1, nombre=Firulais, ...)

    // equals() por valor
    println(m1 == m2)   // true
    println(m1 == m3)   // false

    // copy() - nuevo objeto con cambios puntuales
    val adoptada   = m1.copy(disponible = false)
    val mascotaJoven = m1.copy(edad = 0.5)

    // Desestructuracion
    val (id, nombre, especie) = m1
    println("$id: $nombre - $especie")

    // En bucles
    listOf(m1, m3).forEach { (id2, nombre2, especie2) ->
        println("[$id2] $nombre2: $especie2")
    }
}
