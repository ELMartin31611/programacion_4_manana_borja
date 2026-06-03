enum class EstadoAdopcion(val descripcion: String, val esTerminal: Boolean) {
    PENDIENTE   ("Esperando aprobacion",      false),
    EN_PROCESO  ("En proceso de adopcion",    false),
    APROBADA    ("Adopcion aprobada",         true),
    RECHAZADA   ("Adopcion rechazada",        true),
    CANCELADA   ("Cancelada por adoptante",   true);

    fun puedeTransicionarA(siguiente: EstadoAdopcion): Boolean = when (this) {
        PENDIENTE  -> siguiente == EN_PROCESO || siguiente == CANCELADA
        EN_PROCESO -> siguiente == APROBADA || siguiente == RECHAZADA
        else       -> false
    }
}

fun main() {
    val estado = EstadoAdopcion.EN_PROCESO
    println(estado.descripcion)  // En proceso de adopcion
    println(estado.esTerminal)   // false

    // when exhaustivo - sin else porque el compilador conoce todos los casos
    val icono = when (estado) {
        EstadoAdopcion.PENDIENTE   -> "⏰"
        EstadoAdopcion.EN_PROCESO  -> "⏳"
        EstadoAdopcion.APROBADA    -> "✅"
        EstadoAdopcion.RECHAZADA   -> "❌"
        EstadoAdopcion.CANCELADA   -> "🚫"
    }
    println(icono)  // ⏳

    println(estado.puedeTransicionarA(EstadoAdopcion.APROBADA))  // true
}
