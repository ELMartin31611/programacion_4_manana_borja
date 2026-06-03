class MascotaInmutable(val nombre: String, val especie: String)   // solo lectura

class ContadorAdopciones(var total: Int = 0) {                    // lectura y escritura
    fun registrar() { total++ }
    fun reiniciar() { total = 0 }
}

// Sin val/var - parametro del constructor, NO propiedad
// Solo accesible dentro del bloque init
class RegistroTemporal(nombreMascota: String) {
    val nombreUpper = nombreMascota.uppercase()
    // nombreMascota no existe fuera de aqui
}
