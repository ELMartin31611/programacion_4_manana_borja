fun main() {
    println("Listas - Inmutables")

    val mascotas = listOf("Firulais", "Mishi", "Bugs", "Mishi", "Tweety")

    println("Size ${mascotas.size}")
    println("Mostrar el elemento indice 0: ${mascotas[0]}")
    println("Mostrar el primer elemento: ${mascotas.first()}")
    println("Mostrar el ultimo elemento: ${mascotas.last()}")
    println("Mostrar el elemento indice 2: ${mascotas.get(2)}")
    println("Mostrar indice del elemento: ${mascotas.indexOf("Mishi")}")
    println("Mostrar existencia del elemento: ${mascotas.contains("Bugs")}")
    println("Verificar existencia de un elemento: ${"Mishi" in mascotas}")

    // Sublista
    println("Sublista: ${mascotas.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${mascotas.take(2)}")
    println("Suprimir tres primeros elementos: ${mascotas.drop(3)}")
    println("Tomar los ultimos dos elementos: ${mascotas.takeLast(2)}")

    for (mascota in mascotas) {
        println(mascota)
    }

    println("Listas - Mutables")

    val refugio = mutableListOf("Perro", "Gato", "Conejo", "Ave")
    println(refugio)

    refugio.add("Hamster")
    println(refugio)

    refugio.add(0, "Tortuga")
    println(refugio)

    refugio.remove("Hamster")
    println(refugio)

    refugio[1] = "Gato persa"
    println(refugio)

    println("ArrayDeque")

    val cola = ArrayDeque<String>()
    println(cola)

    cola.addFirst("Firulais")
    println(cola)

    cola.addLast("Mishi")
    println(cola)

    cola.addLast("Bugs")
    println(cola)

    cola.removeFirst()
    println(cola)

    cola.removeLast()
    println(cola)
}
