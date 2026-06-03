class EdadMascota(anios: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar
    var anios: Double = anios
        set(value) {
            require(value >= 0.0) { "La edad no puede ser negativa" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCION: el usuario consulta la edad en meses sin saber la formula
    val meses: Int
        get() = (anios * 12).toInt()

    val edadHumana: Int
        get() = (anios * 7).toInt()

    val etapa: String
        get() = when {
            anios < 0.5  -> "Recien nacido"
            anios < 1.0  -> "Cachorro"
            anios < 3.0  -> "Joven"
            anios < 8.0  -> "Adulto"
            else         -> "Senior"
        }
}

fun main() {
    val edad = EdadMascota(2.0)
    println("${edad.anios} anios = ${edad.meses} meses = ${edad.edadHumana} anios humanos")
    println(edad.etapa)  // Joven

    edad.anios = 0.3
    println("${edad.anios} anios -> ${edad.etapa}")  // Cachorro

    // edad.anios = -1.0  // IllegalArgumentException
}
