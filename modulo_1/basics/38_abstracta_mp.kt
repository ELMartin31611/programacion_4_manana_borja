abstract class Animal(val nombre: String) {
    // abstract - las subclases DEBEN implementar esto (herencia forzada)
    abstract val especie: String
    abstract val tamanio: String
    abstract fun descripcion(): String

    // concreto - disponible en todas las subclases (reutilizacion)
    fun comparar(otro: Animal): String = when {
        tamanio == otro.tamanio -> "$nombre y ${otro.nombre} son del mismo tamanio"
        tamanio == "Grande"     -> "$nombre es mas grande que ${otro.nombre}"
        else                    -> "$nombre es mas pequenio que ${otro.nombre}"
    }

    // Polimorfismo: toString usa descripcion que es polimorfica
    override fun toString() = "${descripcion()} | Especie: $especie | Tamanio: $tamanio"
}

class Perro(nombre: String, val raza: String) : Animal(nombre) {
    override val especie: String get() = "Perro"
    override val tamanio: String get() = if (raza in listOf("Labrador", "Pastor")) "Grande" else "Pequenio"
    override fun descripcion() = "Perro $raza llamado $nombre"
}

class Gato(nombre: String, val interior: Boolean) : Animal(nombre) {
    override val especie: String get() = "Gato"
    override val tamanio: String get() = "Pequenio"
    override fun descripcion() = "Gato ${if (interior) "de interior" else "callejero"} llamado $nombre"
}

class Conejo(nombre: String, val pesoKg: Double) : Animal(nombre) {
    override val especie: String get() = "Conejo"
    override val tamanio: String get() = if (pesoKg > 3.0) "Grande" else "Pequenio"
    override fun descripcion() = "Conejo de ${pesoKg}kg llamado $nombre"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier Animal
    val animales: List<Animal> = listOf(
        Perro("Firulais", "Labrador"),
        Gato("Mishi", true),
        Conejo("Bugs", 2.5)
    )

    animales.forEach { println(it) }  // toString polimorfico

    val masGrande = animales.maxByOrNull { if (it.tamanio == "Grande") 1 else 0 }
    println("\nAnimal mas grande: ${masGrande?.nombre}")

    println(animales[0].comparar(animales[1]))
}
