
fun main() {
  
    println("Tipos de datos")
    println("Numeros Enteros")
    val numero1: Byte= 127
    println("Numero Byte $numero1")
    
    val numero2: Short= 32_765
    println("Numero Short $numero2")
    
    val numero3: Int= 12
    println("Numero Int $numero3")
    
    val numero4: Long= 12_122_122_122_123_123L
    println("Numero Long $numero4")
    
    
     println("Numero Decimales")
    val numero5: Float= 3.14f
    println("Numero Float $numero5")

    val numero6: Double= 3.141592
    println("Numero Double $numero6")
    
    
    //Inferido
    
    val nombre="Juana"
    val edad=56
    
    println("Nombre $nombre")
    
    val nombreTipo=nombre::class.simpleName
    println("Tipo inferido Nombre: ${nombreTipo}")
    println("Tipo inferido Nombre: ${nombre::class.simpleName}")
    println("Edad: $edad")
    val edadTipo=edad::class.simpleName
    println("Tipo inferido edad: ${edadTipo}")
    println("Tipo inferido edad: ${edad::class.simpleName}")
    
    
    
}