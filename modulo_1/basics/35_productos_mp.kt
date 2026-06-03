data class Especie(val id: Int, val nombre: String)

data class Mascota(
    val id: Int,
    val nombre: String,
    val edad: Double,
    val peso: Double,
    val especie: Especie,
    val disponible: Boolean = true
) {
    // ABSTRACCION: el usuario consulta adoptable sin saber la logica
    val adoptable: Boolean get() = disponible && peso > 0
    val edadHumana: Int get() = (edad * 7).toInt()

    // Devuelve una copia - inmutabilidad como forma de encapsulamiento
    fun marcarAdoptada(): Mascota {
        return copy(disponible = false)
    }
}

// ENCAPSULAMIENTO: el estado del catalogo es privado y mutable internamente
object CatalogoRefugio {
    private val especies = mutableListOf(
        Especie(1, "Perro"),
        Especie(2, "Gato"),
        Especie(3, "Conejo")
    )
    private val mascotas = mutableListOf<Mascota>()
    private var siguienteId = 1

    fun agregarMascota(nombre: String, edad: Double, peso: Double, especieId: Int): Mascota? {
        val especie = especies.find { it.id == especieId } ?: return null
        val mascota = Mascota(siguienteId++, nombre, edad, peso, especie)
        mascotas.add(mascota)
        return mascota
    }

    // ABSTRACCION: interfaz publica limpia - solo lectura de listas
    fun listar(): List<Mascota>              = mascotas.toList()
    fun adoptables(): List<Mascota>          = mascotas.filter { it.adoptable }
    fun porEspecie(id: Int): List<Mascota>   = mascotas.filter { it.especie.id == id }
    fun buscar(query: String): List<Mascota> =
        mascotas.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoRefugio.agregarMascota("Firulais",  3.0, 12.5, 1)
    CatalogoRefugio.agregarMascota("Rex",       1.5,  0.0, 1)
    CatalogoRefugio.agregarMascota("Mishi",     2.0,  4.0, 2)
    CatalogoRefugio.agregarMascota("Michi",     5.0,  3.5, 2)
    CatalogoRefugio.agregarMascota("Bugs",      1.0,  2.0, 3)
    CatalogoRefugio.agregarMascota("Bunny",     3.0,  1.8, 3)
    CatalogoRefugio.agregarMascota("Toby",      4.0,  8.0, 1)

    println("=== Todas las mascotas ===")
    CatalogoRefugio.listar().forEach { m ->
        val estado = if (m.adoptable) "✅" else "❌"
        println("$estado ${m.nombre} (${m.especie.nombre}) - Edad humana: ${m.edadHumana} anios")
    }

    println("\n=== Adoptables ===")
    CatalogoRefugio.adoptables()
        .forEach { println("  ${it.nombre}: ${it.especie.nombre}") }
}
