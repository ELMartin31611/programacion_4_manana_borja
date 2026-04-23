//El usuario de esta clase solo sabe que puede hacer con un producto
//No necesita saber como se calcula precioConIva ni como funciona disponible



class Producto(
    val id:     Int,
    val nombre: String,
    val precio: Double,
    private val stock: Int    //privado - el usuario no manipula el stock directamente

){
    val precioConIva: Double
    get() = precio * 1.19

    val disponible:Boolean
    get()  = stock > 0

    override fun toString()= "$nombre ($${"%.2f".format(precio)})"
}


fun main(){

    val teclado = Producto(1, "teclado mecanico", 89.99, 15)

        // El código externo usa la interfaz pública — no sabe el detalle interno
    println(teclado.disponible)   // true
    println(teclado.precioConIva) // 106.99
    // teclado.stock = 0           // ERROR — privado, protegido por diseño

}
