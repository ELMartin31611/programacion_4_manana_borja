class Mascota(val nombre: String, val especie: String) {
    val descripcion: String get() = "$nombre ($especie)"

    // Siempre llaman al constructor primario con this(...)
    constructor(nombre: String) : this(nombre, "Perro")
    constructor(id: Int, nombre: String) : this(nombre, "Gato")

    override fun toString() = "Mascota(${nombre} - ${especie})"
}

fun main() {
    val m1 = Mascota("Firulais", "Perro")
    val m2 = Mascota("Mishi")           // especie por defecto: Perro
    val m3 = Mascota(3, "Bugs")         // desde id: especie Gato

    println(m1)  // Mascota(Firulais - Perro)
    println(m2)  // Mascota(Mishi - Perro)
    println(m3)  // Mascota(Bugs - Gato)
}
