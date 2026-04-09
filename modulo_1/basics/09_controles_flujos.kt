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




 println("Controles de Flujo")
    println("Condicional If - else")

    println("Tiene seguro medico s/n")
    val tiendaSegura = readLine()?.trim()?.lowercase() == "s"

    println("Costo Base: ")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (tiendaSegura) {
        val cobertura = costoBase * 0.80
        println("Seguro cubre: $${"%.2f".format(cobertura)}")
    } else {
        println("Pago Particular: $${"%.2f".format(costoBase)}")
    }



       println("tipo de examen (laboratorio / imagen): ")
    val tipo = readLine()?.trim()?.lowercase()

    if (tipo == "laboratorio") {
        println("Debe estar en ayunas para el examen de laboratorio")
    } else if (tipo == "imagen") {
        println("Siga las indicaciones medicas para el examen de imagen")
    } else {
        println("Tipo de examen no válido")
    }


    println("control de flujo ")
    println("Condicionaales If - Multiples condiciones ")
    println("Presion sistolica mmHg ")
    
    val sistolica = readLine()?.toIntOrNull()?:0
    
    val clasificacion = if (sistolica <=90){
        "Hipotension"
    } else if (sistolica <=119){
        "Normal"
    }else if (sistolica <=129){
        "Elevada"
    }else if (sistolica <=139){
        "Hipertension graaado1"
    }else if (sistolica <=179){
        "Hipertension grado 2"
    }else {
        "Crisis Hipertensiva"
    }
    
    println("Clasificacion: $clasificacion ") 




     println("Controles de flujo")
    println("condicionales If - Anidado")
    println("Tiene antecedentes cardiacos ?")
    val tieneAntecedentes = readLine()?.trim()?.lowercase()=="s"
    println("Freceuncia Cardiaca (lpm)")
    val frecuencia =reaadLine()?.toIntOrNull()?:0
    
    if(tieneAntecedentes){
        println("Paciente con antecedentes cardiaacos")
        if(frencuencia <50){
            println("Bradicardia severa")
            
        }else if (frecuencia>100){
            println("taquicardia")
        }else{
            print("Frecuencia Normal")
        }
    }else {
        println("Paciente sin antecedentes cardiacos")
        if(frecuencia <50 || frecuenciaa >100){
            println("Frecuencia fueraa del rango normal")
            
        }else{
            println("Frecuenciaaa Cardiaca Normal")
        }
    }
    


        println("Controles de flujo")
    println("Condicionales If - Anidado")

    println("Ingrese tipo de consulta :")
    val consultas = readLine()?.trim()?.lowercase()

    println("Ingrese tiempo de la consulta :")
    val tiempo = readLine()?.toIntOrNull() ?: 0

    if (consultas == "agendada") {
        println("Consulta agendada")

    } else if (consultas == "en curso") {
        println("Realizando consulta")

        if (tiempo < 30) {
            println("Consulta normal")
        } else {
            println("Consulta extendida")
        }

    } else if (consultas == "finalizada") {
        println("Consulta finalizada")

    } else {
        println("No hay consultas")
    }
}

