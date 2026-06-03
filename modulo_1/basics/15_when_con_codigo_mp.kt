fun main() {
    println("Controles de Flujo When - con bloque de codigos")
    println("Nombre de la mascota en adopcion:")
    val nombreMascota = readLine()?.trim()?.lowercase() ?: "Sin identificacion"
    println("Estado de salud de la mascota (CRITICO/URGENTE/MODERADO/LEVE)")
    val estado = readLine()?.trim()?.uppercase() ?: ""
    when (estado) {
        "CRITICO" -> {
            println("Alerta critica: Mascota: $nombreMascota")
            println("Llamar al veterinario de guardia")
            println("Activar protocolo de atencion urgente")
        }
        "URGENTE" -> {
            println("Urgente: Mascota: $nombreMascota")
            println("Priorizar atencion medica")
            println("Reevaluar en 15 minutos")
        }
        "MODERADO" -> println("Moderado: mascota: $nombreMascota requiere seguimiento")
        "LEVE" -> println("Leve: mascota: $nombreMascota puede continuar en espera normal")
        else -> println("Estado no reconocido")
    }
}
