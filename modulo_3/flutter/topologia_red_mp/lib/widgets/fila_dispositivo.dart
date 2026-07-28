import 'package:flutter/material.dart';
import '../models/dispositivo.dart';
import 'avatar_badge.dart';

class FilaMascota extends StatelessWidget {
  final InfoMascota mascota;

  const FilaMascota({super.key, required this.mascota});

  IconData get _icono => switch (mascota.tipo) {
    'perro'  => Icons.pets,
    'gato'   => Icons.cruelty_free,
    'conejo' => Icons.grass,
    'ave'    => Icons.flutter_dash,
    _        => Icons.pets,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // AvatarBadge — Stack del Paso 4
          AvatarBadgeMp(
            nombre:  mascota.nombre,
            alertas: mascota.alertas,
            activo:  mascota.activo,
          ),

          const SizedBox(width: 12),

          // Column: nombre, chip y Wrap de etiquetas
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        mascota.nombre,
                        style:    const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(_icono, size: 16, color: Colors.grey.shade500),
                  ],
                ),
                Text(mascota.chip,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4, runSpacing: 4,
                  children: mascota.etiquetas.map((tag) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color:        Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border:       Border.all(color: Colors.indigo.shade200),
                      ),
                      child: Text(tag,
                          style: TextStyle(
                              fontSize:   10,
                              color:      Colors.indigo.shade700,
                              fontWeight: FontWeight.w500)),
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
