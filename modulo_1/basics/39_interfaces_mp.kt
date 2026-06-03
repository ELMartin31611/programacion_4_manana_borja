interface Registrable {
    val id: String                    // abstracta - debe implementarse
    fun registrar(): String           // abstracta - debe implementarse
    val version: Int get() = 1        // con default - puede sobreescribirse
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {                // implementacion por defecto
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

// POLIMORFISMO: SolicitudAdopcion puede usarse donde se espere Registrable O Validable
data class SolicitudAdopcion(
    override val id: String,
    val adoptante: String,
    val mascotaNombre: String,
    val mascotaEspecie: String
) : Registrable, Validable {

    override fun registrar() =
        "$id|$adoptante|$mascotaNombre|$mascotaEspecie"

    override val errores: List<String> get() = buildList {
        if (adoptante.isBlank())       add("El adoptante no puede estar vacio")
        if (mascotaNombre.isBlank())   add("La mascota debe tener nombre")
        if (mascotaEspecie.isBlank())  add("La especie es requerida")
    }

    override fun validar() = esValido
}

fun main() {
    val solicitud1 = SolicitudAdopcion("SOL001", "Maria", "Firulais", "Perro")
    val solicitud2 = SolicitudAdopcion("SOL002", "",      "",         "")

    // Polimorfismo por interfaz
    fun procesarRegistrable(r: Registrable) = println("→ ${r.registrar()}")
    fun procesarValidable(v: Validable) {
        println("Valido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarRegistrable(solicitud1)  // → SOL001|Maria|Firulais|Perro
    procesarValidable(solicitud1)    // Valido: true / Sin errores
    procesarValidable(solicitud2)    // Valido: false / ❌ ...
}
