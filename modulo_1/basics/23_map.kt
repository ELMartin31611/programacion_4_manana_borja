fun main() {
    println("Map Inmutaable")
    val capitales = mapOf(
    "Espana" to "Barcelona",
    "Francia" to "Paris",
    "Alemania" to "Berlin",
    "Italia" to "Roma"
    )
    
    println(capitales["Espana"])
    println(capitales["Portugal"])
    println(capitales.getOrDefault("Espana", "Desconocido"))
    println(capitales.getOrDefault("Portugal", "Desconocido"))
    println(capitales)
    println(capitales.keys)
    println(capitales.values)
    println(capitales.entries)
    for((pais, capital) in capitales){
        println("$pais - $capital")
        
    }
    
    println("Map Mutable")
    val inventario = mapOf(
        "Laptops" to 10,
        "Impresoras" to 4,
        "Teclados" to 12,
        "Mouse" to 8
    )
    
    inventario["Monitores"]=5
    println(inventario)
    inventario["Laptops"]=20
    println(inventario)
    inventario("Mouse")
    println(inventario)
    inventario.getOfPut("Proyector"){15}
    println(inventario)
    inventario.getOrPut("Teclados"){15}
    println(inventario)
    
        
        
}