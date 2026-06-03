// La interfaz define el contrato - QUE puede hacer
// Las implementaciones definen el COMO
interface Adoptable {
    fun procesar(nombreAdoptante: String): Boolean
    val especie: String
}

class Perro(val nombre: String) : Adoptable {
    override val especie = "Perro"
    override fun procesar(nombreAdoptante: String): Boolean {
        println("🐶 Adoptando a $nombre por $nombreAdoptante")
        return true
    }
}

class Gato(val nombre: String) : Adoptable {
    override val especie = "Gato"
    override fun procesar(nombreAdoptante: String): Boolean {
        println("🐱 Adoptando a $nombre por $nombreAdoptante")
        return true
    }
}

class Conejo(val nombre: String) : Adoptable {
    override val especie = "Conejo"
    override fun procesar(nombreAdoptante: String): Boolean {
        println("🐰 Adoptando a $nombre por $nombreAdoptante")
        return true
    }
}

// Esta funcion no sabe ni le importa que tipo de animal es
// Solo sabe que recibe algo que implementa Adoptable - POLIMORFISMO
fun registrarAdopcion(adoptante: String, mascota: Adoptable) {
    println("Procesando adopcion de ${mascota.especie}...")
    val exito = mascota.procesar(adoptante)
    println(if (exito) "✅ Adopcion exitosa" else "❌ Adopcion fallida")
}

fun main() {
    val mascotas: List<Adoptable> = listOf(
        Perro("Firulais"),
        Gato("Mishi"),
        Conejo("Bugs")
    )

    // Misma funcion - comportamiento distinto segun el tipo
    mascotas.forEach { registrarAdopcion("Maria Lopez", it) }
}
