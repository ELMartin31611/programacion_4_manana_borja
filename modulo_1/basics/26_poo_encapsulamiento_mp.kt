class RefugioMascotas(nombreRefugio: String, capacidadInicial: Int) {

    val nombreRefugio: String = nombreRefugio    // publico - cualquiera puede leer

    private var capacidad: Int = capacidadInicial  // privado - solo esta clase lo modifica

    internal val codigoRefugio: String =           // internal - visible en el mismo modulo
        "REF${(100000..999999).random()}"

    protected open fun calcularOcupacion(): Double = capacidad * 0.75  // protected - visible en subclases

    // La capacidad solo cambia a traves de estos metodos - NUNCA directamente
    fun ingresarMascota(cantidad: Int) {
        require(cantidad > 0) { "La cantidad debe ser positiva" }
        capacidad += cantidad
        println("Ingresadas: $cantidad mascotas | Nueva capacidad: ${consultarCapacidad()}")
    }

    fun egresarMascota(cantidad: Int): Boolean {
        require(cantidad > 0) { "La cantidad debe ser positiva" }
        if (cantidad > capacidad) {
            println("No hay suficientes mascotas en el refugio")
            return false
        }
        capacidad -= cantidad
        println("Adoptadas: $cantidad mascotas | Nueva capacidad: ${consultarCapacidad()}")
        return true
    }

    fun consultarCapacidad(): String = "$capacidad mascotas"
}

fun main() {
    val refugio = RefugioMascotas("Patitas Felices", 20)

    refugio.ingresarMascota(5)    // Ingresadas: 5 mascotas | Nueva capacidad: 25 mascotas
    refugio.egresarMascota(3)     // Adoptadas: 3 mascotas | Nueva capacidad: 22 mascotas
    refugio.egresarMascota(100)   // No hay suficientes mascotas en el refugio

    println(refugio.nombreRefugio)        // Patitas Felices - acceso publico permitido
    println(refugio.consultarCapacidad()) // 22 mascotas
    // refugio.capacidad = 999           // ERROR - capacidad es privada
}
