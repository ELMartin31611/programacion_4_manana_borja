 fun main() {
 rintln("Controles de Flujo")
    println("Condicional If - else")

    println("Tiene seguro medico s/n")
    val tiendaSegura = readLine()?.trim()?.lowercase() == "s"

    println("Costo Base: ")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (tiendaSegura) {
        val cobertura = costoBase * 0.80
        println("Seguro cubre: $${"%.2f".format(cobertura)}")
    } else {
        println("Pago Particular: $${"%.2f".format(costoBase)}")
    }



       println("tipo de examen (laboratorio / imagen): ")
    val tipo = readLine()?.trim()?.lowercase()

    if (tipo == "laboratorio") {
        println("Debe estar en ayunas para el examen de laboratorio")
    } else if (tipo == "imagen") {
        println("Siga las indicaciones medicas para el examen de imagen")
    } else {
        println("Tipo de examen no válido")
    }
}