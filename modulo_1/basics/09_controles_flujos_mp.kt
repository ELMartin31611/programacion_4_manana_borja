fun main() {

    println("Controles de Flujo en adopción de mascotas 🐾")
    println("Condicional If")

    println("Ingresa la edad de la mascota:")
    val edad = readLine()?.toIntOrNull() ?: 0

    if (edad < 1) {
        println("Cachorro muy pequeño: requiere cuidados especiales ")
    }

    if (edad >= 1 && edad <= 5) {
        println("Mascota joven: ideal para adopción ")
    }

    if (edad > 5) {
        println("Mascota adulta: adopción responsable recomendada ")
    }

    println("Edad registrada de la mascota: $edad años")
    
}