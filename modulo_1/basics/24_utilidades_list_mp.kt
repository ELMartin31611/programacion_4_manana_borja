fun main() {
    println("Utilidades List")

    val edades = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    println(edades)

    val edadesHumanas = edades.map { it * 7 }
    println(edadesHumanas)

    val etiquetasMascotas = edades.map { "Mascota$it" }
    println(etiquetasMascotas)

    println("filter")
    val cachorrros = edades.filter { it <= 2 }
    println(cachorrros)

    val adultos = edades.filter { it > 5 }
    println(adultos)

    val adultosJovenes = edades.filter { it % 2 == 0 && it > 5 }
    println(adultosJovenes)

    val noBebes = edades.filterNot { it <= 2 }
    println(noBebes)

    val mezcla = listOf(1, "Firulais", 2, "Mishi", true, 42)
    val soloNombres = mezcla.filterIsInstance<String>()
    println(soloNombres)

    println("reduce")
    val costos = listOf(50.0, 30.0, 20.0, 40.0, 10.0)
    val totalCostos = costos.reduce { acc, n -> acc + n }
    println(totalCostos)
    val producto = costos.reduce { acc, n -> acc * n }
    println(producto)
    val totalConFondo = costos.fold(100.0) { acc, n -> acc + n }
    println(totalConFondo)
    val totalConFondoMultiplica = costos.fold(1.0) { acc, n -> acc * n }
    println(totalConFondoMultiplica)

    println("Ordenacion")
    println("Ascendente: ${edades.sorted()}")
    println("Descendente: ${edades.sortedDescending()}")
    println("Sorted by: ${edades.sortedBy { -it }}")

    println("Agregacion")
    println("Sumar: ${edades.sum()}")
    println("Promedio: ${edades.average()}")
    println("Minimo: ${edades.min()}")
    println("Maximo: ${edades.max()}")
    println("Contar mayores a 4: ${edades.count { it > 4 }}")
    println("Busqueda")
    println("Buscar: ${edades.find { it > 4 }}")
    println("Buscar ultimo: ${edades.findLast { it > 4 }}")
    println("Buscar any: ${edades.any { it > 4 }}")
    println("Buscar todo: ${edades.all { it > 4 }}")
    println("Buscar none: ${edades.none { it > 4 }}")
}
