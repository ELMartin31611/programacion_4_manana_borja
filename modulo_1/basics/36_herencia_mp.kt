// Sin open - no se puede heredar (proteccion por defecto)
// class Animal(val nombre: String)
// class Perro : Animal("Rex")  // ERROR - Animal es final

// Con open - la jerarquia esta disenada para ello
open class Animal(val nombre: String, val sonido: String) {
    // open - la subclase PUEDE sobreescribir
    open fun hacerSonido() = println("$nombre dice: $sonido")
    open fun descripcion() = "Soy $nombre"

    // Sin open - la subclase NO puede sobreescribir
    fun respirar() = println("$nombre respira")
}

// HERENCIA: Perro reutiliza todo de Animal y especializa hacerSonido
class Perro(nombre: String) : Animal(nombre, "Guau") {
    override fun hacerSonido() {
        super.hacerSonido()             // reutiliza la implementacion del padre
        println("(mueve la cola)")      // anade comportamiento propio
    }
    override fun descripcion() = "${super.descripcion()}, un perro en adopcion"
}

class Gato(nombre: String, val interior: Boolean) : Animal(nombre, "Miau") {
    override fun descripcion() =
        "${super.descripcion()}, un gato ${if (interior) "de interior" else "callejero"}"
}

fun main() {
    val perro = Perro("Firulais")
    perro.hacerSonido()
    // Firulais dice: Guau
    // (mueve la cola)

    val gato = Gato("Mishi", true)
    println(gato.descripcion())  // Soy Mishi, un gato de interior

    // Herencia - Perro y Gato tienen todo lo de Animal mas lo propio
    perro.respirar()  // Firulais respira - heredado de Animal
}
