fun main() {
    println("Controles de Flujo When- con bloque de codigos")
    println("Nombre del Paciente")
    val nombrePaciente = readLine()?.trim()?.lowercase()?:"Sin identificacion"
    println("Tiene Nivel Alerta (CRITICO/URGENTE/MODERADO/LEVE)")
    val nivel = readLine()?.trim()?.uppercase()?:""
    when (nivel){
        "CRITICO"->{
            println("Alerta critica: Paciente: $nombrePaciente")
            println("Llamar al medico de guardia")
            println("Activar protocolo urgencia critica")
        }
        "URGENTE"->{
            println("Urgente: Paciente:$nombrePaciente")
            println("Priorizar en la ala de espera")
            println("Reevaluar en 15 minutos")
        }
        "MODERADO"->println("Moderado:paciente:$nombrePaciente")
        "LEVE"->println("Level paciente:$nombrePaciente continuar espera normal")
        else -> println("nivel no reconocido")
    }
}