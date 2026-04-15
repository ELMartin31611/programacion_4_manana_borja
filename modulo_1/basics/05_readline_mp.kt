fun main() {
  // Readline
    println("Escribe el nombre de la mascota: ")
    val nombreMascota = readLine()
    println("Nombre de la mascota: $nombreMascota")
    
    println("Escribe el tipo de mascota (perro, gato, etc.): ")
    val tipoMascota = readLine() ?: "desconocido"
    println("Tipo de mascota: $tipoMascota")
    
    println("Escribe la edad de la mascota: ")
    val edadMascota = readLine() ?: "0"
    println("Edad de la mascota: $edadMascota años")
    
    /*
    comentario multi linea 
    */
    
    // Comentario de una sola linea
    
    /**
    * Sistema de adopción de mascotas
    * Entrada de datos del usuario
    * @param nombreMascota nombre del animal
    * @return ficha básica de la mascota
    */
}