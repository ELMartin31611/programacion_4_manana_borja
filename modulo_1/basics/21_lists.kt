fun main() {
    println("Listas-Inmutables")

    val frutas = listOf("manzana", "banana", "cereza", "banana", "pera")

    println("Size ${frutas.size}")
    println("Mostrar el elemento índice 0: ${frutas[0]}")
    println("Mostrar el primer elemento: ${frutas.first()}")
    println("Mostrar el último elemento: ${frutas.last()}")
    println("Mostrar el elemento índice 2: ${frutas.get(2)}")
    println("Mostrar índice del elemento: ${frutas.indexOf("banana")}")
    println("Mostrar existencia del elemento: ${frutas.contains("cereza")}")
    println("Verificar existencia de un elemento: ${"banana" in frutas}")

    // Sublista
    println("Sublista: ${frutas.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${frutas.take(2)}")
    println("Suprimir tres primeros elementos: ${frutas.drop(3)}")
    println("Tomar los últimos dos elementos: ${frutas.takeLast(2)}")

    for (fruta in frutas) {
        println(fruta)
    }

    println("Listas-Mutables")

    val colores = mutableListOf("blanco", "azul", "amarillo", "rojo")
    println(colores)

    colores.add("verde")
    println(colores)

    colores.add(0, "morado")
    println(colores)

    colores.remove("verde")
    println(colores)

    colores[1] = "gris"
    println(colores)

    println("ArrayDeque")

    val deque = ArrayDeque<Int>()
    println(deque)

    deque.addFirst(1)
    println(deque)

    deque.addLast(2)
    println(deque)

    deque.addLast(0)
    println(deque)

    deque.removeFirst()
    println(deque)

    deque.removeLast()
    println(deque)
}