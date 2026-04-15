fun main() {

    println("Controles de Flujo 🐾")
    println("Condicional If - Else en adopción de mascotas")

    println("¿La mascota tiene vacunas? (s/n)")
    val tieneVacunas = readLine()?.trim()?.lowercase() == "s"

    println("Costo base de adopción:")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (tieneVacunas) {
        val descuento = costoBase * 0.80
        println("Descuento aplicado (20%): $${"%.2f".format(descuento)}")
    } else {
        println("Pago completo sin descuento: $${"%.2f".format(costoBase)}")
    }

    println("Tipo de adopción (cachorro / adulto): ")
    val tipo = readLine()?.trim()?.lowercase()

    if (tipo == "cachorro") {
        println("Requiere seguimiento veterinario ")
    } else if (tipo == "adulto") {
        println("Listo para adopción responsable ")
    } else {
        println("Tipo de mascota no válido ")
    }
}