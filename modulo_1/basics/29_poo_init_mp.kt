class Adoptante(val nombre: String, val contacto: String) {
    val nombreNormalizado: String
    val tipoContacto: String

    init {
        // Encapsulamiento en accion: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacio" }
        require(contacto.contains("@") || contacto.all { it.isDigit() || it == '+' || it == ' ' }) {
            "Contacto invalido: $contacto"
        }

        nombreNormalizado = nombre.trim().lowercase()
        tipoContacto = if (contacto.contains("@")) "email" else "telefono"
    }
}

fun main() {
    val a = Adoptante("  Maria Lopez  ", "maria@adopcion.com")
    println(a.nombreNormalizado)  // maria lopez
    println(a.tipoContacto)       // email

    // Adoptante("", "invalido")  // IllegalArgumentException - require falla
}
