fun main() {
   println("Controles de flujo")
    println("Condicionales If - Anidado")

    println("Ingrese tipo de consulta :")
    val consultas = readLine()?.trim()?.lowercase()

    println("Ingrese tiempo de la consulta :")
    val tiempo = readLine()?.toIntOrNull() ?: 0

    if (consultas == "agendada") {
        println("Consulta agendada")

    } else if (consultas == "en curso") {
        println("Realizando consulta")

        if (tiempo < 30) {
            println("Consulta normal")
        } else {
            println("Consulta extendida")
        }

    } else if (consultas == "finalizada") {
        println("Consulta finalizada")

    } else {
        println("No hay consultas")
    }
}