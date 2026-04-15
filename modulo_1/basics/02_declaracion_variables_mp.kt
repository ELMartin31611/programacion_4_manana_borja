fun main() {
    // No mutable
    val nombreMascota = "Luna"
    val edadMascota: Int = 2
    val tipo = "Perro"
    
    // Mutable
    var adoptantes = 0
    adoptantes = adoptantes + 1
    println("Personas interesadas en adoptar: $adoptantes")
    
    adoptantes = adoptantes - 1
    println("Personas interesadas en adoptar: $adoptantes")
    
    println("$nombreMascota es un $tipo de $edadMascota años y busca un hogar ")
}