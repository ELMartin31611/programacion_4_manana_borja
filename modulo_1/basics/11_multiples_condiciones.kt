 fun main() {
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
}   
