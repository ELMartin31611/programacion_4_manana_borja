fun main() {
  
    println("Tipos de datos en adopción de mascotas")
    println("Numeros Enteros")
    
    val perrosDisponibles: Byte = 10
    println("Perros disponibles (Byte): $perrosDisponibles")
    
    val gatosDisponibles: Short = 150
    println("Gatos disponibles (Short): $gatosDisponibles")
    
    val totalMascotas: Int = 320
    println("Total de mascotas (Int): $totalMascotas")
    
    val visitasRefugio: Long = 12_122_122_122L
    println("Visitas al refugio (Long): $visitasRefugio")
    
    
    println("Numeros Decimales")
    
    val pesoPromedio: Float = 3.5f
    println("Peso promedio mascotas (Float): $pesoPromedio kg")

    val costoCuidado: Double = 150.75
    println("Costo de cuidado mensual (Double): $costoCuidado")
    
    
    // Inferido
    
    val nombreMascota = "Luna"
    val edadMascota = 2
    
    println("Nombre de la mascota: $nombreMascota")
    
    val nombreTipo = nombreMascota::class.simpleName
    println("Tipo inferido Nombre: ${nombreTipo}")
    println("Tipo inferido Nombre: ${nombreMascota::class.simpleName}")
    
    println("Edad de la mascota: $edadMascota")
    
    val edadTipo = edadMascota::class.simpleName
    println("Tipo inferido edad: ${edadTipo}")
    println("Tipo inferido edad: ${edadMascota::class.simpleName}")
}