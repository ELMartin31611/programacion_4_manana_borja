fun main() {

println("Controles de Flujo")
println("Condicional If")
val temperatura = readLine ()?: toDoubleOrNull()?:36.5

if(temperatura > 38.0){
    println("Fiebre detectaada: derivar consulta prioritaria")
 }
 
 if(temperatura > 40.0){
    println("Fiebre alta: atencion de emergencia inmediata")
 }
 
 println("Temperatoraa registrada: $temperatura grados centigrados")

}

