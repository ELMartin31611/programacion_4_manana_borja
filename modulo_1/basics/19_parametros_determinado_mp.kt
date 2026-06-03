fun main() {
    println("Funciones - Parametros por defecto")
    println(registrarMascota("Firulais", 3, "Perro", true))
    println(registrarMascota("Mishi"))
    println(registrarMascota("Bugs", 1))
    println(registrarMascota("Tweety", 2, "Ave"))

    // argumentos nombrados
    println(registrarMascota(edad = 5, nombre = "Toby", disponible = false))
}

fun registrarMascota(
    nombre: String,
    edad: Int = 1,
    especie: String = "Perro",
    disponible: Boolean = true
): String {
    return "Mascota[$nombre, edad=$edad, especie=$especie, disponible=$disponible]"
}
