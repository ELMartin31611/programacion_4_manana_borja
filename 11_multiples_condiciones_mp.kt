fun main() {

    println("Control de flujo ")
    println("Clasificación de estado de salud de mascotas")

    println("Presión sistólica de la mascota (simulación): ")

    val sistolica = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (sistolica <= 90) {
        "Hipotensión"
    } else if (sistolica <= 119) {
        "Normal"
    } else if (sistolica <= 129) {
        "Elevada"
    } else if (sistolica <= 139) {
        "Hipertensión grado 1"
    } else if (sistolica <= 179) {
        "Hipertensión grado 2"
    } else {
        "Crisis hipertensiva"
    }

    println("Clasificación de salud: $clasificacion")



    println("\nControl de adopción ")
    println("¿La mascota tiene antecedentes médicos? (s/n)")
    val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"

    println("Frecuencia cardíaca de la mascota (lpm):")
    val frecuencia = readLine()?.toIntOrNull() ?: 0

    if (tieneAntecedentes) {
        println("Mascota con antecedentes médicos ")

        if (frecuencia < 50) {
            println("Bradicardia severa ")
        } else if (frecuencia > 100) {
            println("Taquicardia ")
        } else {
            println("Frecuencia normal ")
        }

    } else {
        println("Mascota sin antecedentes médicos ")

        if (frecuencia < 50 || frecuencia > 100) {
            println("Frecuencia fuera del rango normal ")
        } else {
            println("Frecuencia cardíaca normal ")
        }
    }
}