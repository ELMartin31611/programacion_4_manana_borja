fun main() {

    println("Controles de flujo ")
    println("Condicionales If - Anidado en adopción de mascotas")

    println("Ingrese estado de adopción de la mascota (en evaluación / en proceso / adoptada):")
    val estado = readLine()?.trim()?.lowercase()

    println("Ingrese tiempo en evaluación (minutos):")
    val tiempo = readLine()?.toIntOrNull() ?: 0

    if (estado == "en evaluación") {
        println("La mascota está en evaluación ")

    } else if (estado == "en proceso") {
        println("Adopción en proceso ")

        if (tiempo < 30) {
            println("Evaluación rápida ")
        } else {
            println("Evaluación detallada ")
        }

    } else if (estado == "adoptada") {
        println("La mascota ya fue adoptada ")

    } else {
        println("No hay procesos de adopción activos ")
    }
}