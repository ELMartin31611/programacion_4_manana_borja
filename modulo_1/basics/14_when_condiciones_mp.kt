fun main() {
    println("Controles de Flujo When - con condicionales arbitrarias")

    println("Edad del adoptante:")
    val edadAdoptante = readLine()?.toIntOrNull() ?: 0

    println("¿Tiene experiencia con mascotas? (s/n):")
    val tieneExperiencia = readLine()?.trim()?.lowercase() == "s"

    val nivelVivienda = if (tieneExperiencia) {
        println("Tipo de vivienda (CASA / APARTAMENTO / FINCA):")
        readLine()?.trim()?.uppercase() ?: ""
    } else {
        ""
    }

    val tarifaAdopcion = when {
        !tieneExperiencia && edadAdoptante < 18 -> 0.0
        !tieneExperiencia && edadAdoptante >= 65 -> 15.0
        !tieneExperiencia -> 45.0
        nivelVivienda == "FINCA" -> 0.0
        nivelVivienda == "CASA" -> 10.0
        nivelVivienda == "APARTAMENTO" -> 20.0
        else -> 30.0
    }

    println("Tarifa de adopcion: \$${"%.2f".format(tarifaAdopcion)}")
}
