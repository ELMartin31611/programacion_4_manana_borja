fun main() {
  
    val nombreMascota = "Luna"
    val tipo = "Perro"
    val edad = 2
    
    //variable simple
    println("Sistema de adopción de mascotas")
    
    // expresion
    println("Mascota: ${nombreMascota.uppercase()} (${tipo.uppercase()})")
    
    val infoMascota = "Mascota: ${nombreMascota.uppercase()} (${tipo.uppercase()})"
    println(infoMascota)
    
    println("Edad en años humanos: ${edad + 1} años")
     
     
    // String Multilinea
    val tarjeta = """
        |Nombre: $nombreMascota
        |Tipo: $tipo
        |Edad: $edad
        |Adopción: ${if (edad >= 1) "Disponible" else "En observación"}
    """.trimMargin()
    
    println(tarjeta)  
}