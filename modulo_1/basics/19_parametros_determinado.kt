fun main() {
    println("Fuciones-Parametros por defecto")
    println(crearUsuario("Jhon", 25, "admin",true ))
    println(crearUsuario("Luis"))
    println(crearUsuario("Maria", 30 ))
    println(crearUsuario("Juan",305, "viewer"))
    
    //argumentos nombrados
    
    println(crearUsuario(edad=30,nombre="Yaamilet", activo=false))
    
    
}

fun crearUsuario (
nombre:String,
edad:Int=18,
rol: String = "viewer",
activo:Boolean = true
): String{
    return "Usuario[$nombre, edad=$edad, rol=$rol, activo=$activo]"
}