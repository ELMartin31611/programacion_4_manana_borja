fun main() {
    println("Map Inmutable")
    val mascotasRefugio = mapOf(
        "Firulais" to "Perro",
        "Mishi" to "Gato",
        "Bugs" to "Conejo",
        "Tweety" to "Ave"
    )

    println(mascotasRefugio["Firulais"])
    println(mascotasRefugio["Rocky"])
    println(mascotasRefugio.getOrDefault("Firulais", "Desconocido"))
    println(mascotasRefugio.getOrDefault("Rocky", "Desconocido"))
    println(mascotasRefugio)
    println(mascotasRefugio.keys)
    println(mascotasRefugio.values)
    println(mascotasRefugio.entries)
    for ((nombre, especie) in mascotasRefugio) {
        println("$nombre - $especie")
    }

    println("Map Mutable")
    val disponibilidad = mutableMapOf(
        "Firulais" to true,
        "Mishi" to true,
        "Bugs" to false,
        "Tweety" to true
    )

    disponibilidad["Rocky"] = true
    println(disponibilidad)
    disponibilidad["Firulais"] = false
    println(disponibilidad)
    disponibilidad.remove("Bugs")
    println(disponibilidad)
    disponibilidad.getOrPut("Luna") { true }
    println(disponibilidad)
    disponibilidad.getOrPut("Firulais") { true }
    println(disponibilidad)
}
