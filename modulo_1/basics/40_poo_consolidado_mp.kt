// ABSTRACCION: sealed class define los tipos posibles de notificacion del refugio
sealed class NotificacionAdopcion(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String  // cada tipo formatea de forma distinta

    data class Email(
        val destinatario: String,
        val asunto: String,
        val cuerpo: String
    ) : NotificacionAdopcion(asunto, cuerpo) {
        override fun formatear() =
            "📧 Email → $destinatario\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class Push(val dispositivo: String, val icono: String = "🐾")
        : NotificacionAdopcion("Adopcion", "") {
        override fun formatear() = "$icono Push → $dispositivo: $titulo"
    }

    data class Sms(val telefono: String, val texto: String)
        : NotificacionAdopcion("SMS", texto) {
        override fun formatear() = "📱 SMS → $telefono: ${texto.take(160)}"
    }

    object Silenciosa : NotificacionAdopcion("", "") {
        override fun formatear() = "🔕 Notificacion silenciosa"
    }
}

// ABSTRACCION + POLIMORFISMO: interfaz con contrato generico
interface EnviadorNotificacion {
    val nombre: String
    fun enviar(notificacion: NotificacionAdopcion): Boolean
}

// HERENCIA: implementaciones concretas del mismo contrato
class ServicioEmail : EnviadorNotificacion {
    override val nombre = "Email"
    override fun enviar(n: NotificacionAdopcion): Boolean {
        if (n !is NotificacionAdopcion.Email) return false
        println("  [EMAIL] → ${n.destinatario}")
        return true
    }
}

class ServicioPush : EnviadorNotificacion {
    override val nombre = "Push"
    override fun enviar(n: NotificacionAdopcion): Boolean {
        if (n !is NotificacionAdopcion.Push) return false
        println("  [PUSH] → ${n.dispositivo}")
        return true
    }
}

// ENCAPSULAMIENTO: la lista de servicios es privada
class DispatcherRefugio(private val servicios: List<EnviadorNotificacion>) {

    fun enviar(notificacion: NotificacionAdopcion) {
        println(notificacion.formatear())  // POLIMORFISMO: cada tipo formatea distinto
        val exito = servicios.any { it.enviar(notificacion) }
        if (!exito) println("  ⚠️ Sin servicio disponible")
        println()
    }
}

fun main() {
    val dispatcher = DispatcherRefugio(listOf(ServicioEmail(), ServicioPush()))

    listOf(
        NotificacionAdopcion.Email("maria@test.com", "Adopcion Aprobada", "Felicidades, Firulais te espera."),
        NotificacionAdopcion.Push("iPhone-Maria"),
        NotificacionAdopcion.Sms("+573001234567", "Tu solicitud de adopcion fue aprobada"),
        NotificacionAdopcion.Silenciosa
    ).forEach { dispatcher.enviar(it) }
}
