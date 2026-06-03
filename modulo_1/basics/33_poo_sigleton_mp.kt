object ConfiguracionRefugio {
    val nombre: String = "Patitas Felices"
    val direccion: String = "Calle 123, Ciudad"
    private val codigoInterno: String = "REF-SECRETO-456"  // privado - nunca expuesto

    fun contacto() = "refugio@patitasfelices.com"
    fun encabezados() = mapOf("Refugio" to nombre, "Direccion" to direccion)
}

class Adoptante private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        // Factory function - encapsulamiento del constructor
        fun crear(nombre: String, contacto: String): Adoptante? {
            if (nombre.isBlank() || !contacto.contains("@")) return null
            return Adoptante(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "adoptante"
    }
}

fun main() {
    println(ConfiguracionRefugio.contacto())  // refugio@patitasfelices.com
    // ConfiguracionRefugio.codigoInterno    // ERROR - privado

    val a = Adoptante.crear("Maria", "maria@test.com")
    println(a)  // Adoptante(id=1, nombre=Maria)
}
