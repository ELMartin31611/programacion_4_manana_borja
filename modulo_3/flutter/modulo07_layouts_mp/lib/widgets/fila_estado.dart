import 'package:flutter/material.dart';

class FilaEstadoMp extends StatelessWidget {
  final String nombre;
  final String detalle;
  final bool   activo;

  const FilaEstadoMp({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.activo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Ícono de estado
          Icon(
            activo ? Icons.check_circle : Icons.cancel,
            color: activo ? Colors.green : Colors.red,
            size:  20,
          ),
          const SizedBox(width: 12),

          // Expanded — el Column ocupa todo el espacio restante
          // Sin Expanded, un nombre largo desbordaría la Row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:       MainAxisSize.min,
              children: [
                Text(nombre,
                    style:    const TextStyle(fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis),
                Text(detalle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Chip de estado — queda pegado al borde derecho gracias a Expanded
          Container(
            padding:    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color:        (activo ? Colors.green : Colors.red).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              activo ? 'Disponible' : 'Adoptado',
              style: TextStyle(
                fontSize:   11,
                color:      activo ? Colors.green.shade700 : Colors.red.shade700,
                fontWeight: FontWeight.w600,
              ),

            ),
            


          ),
          Stack(
          alignment: Alignment.center,  // alineación por defecto para hijos sin Positioned
          children: [
            Container(width: 60, height: 60, color: Colors.blue.shade100),  // capa inferior
            Positioned(
              top: 4, right: 4,
              child: Container(
                padding:    const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ),
          ],
        )
        ],
      ),
    );
  }
}
