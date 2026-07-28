import 'package:flutter/material.dart';
import '../models/dispositivo.dart';
import '../widgets/chip_resumen.dart';
import '../widgets/fila_dispositivo.dart';

class PantallaTopologiaMp extends StatelessWidget {
  const PantallaTopologiaMp({super.key});

  @override
  Widget build(BuildContext context) {
    final mascotas = [
      const InfoMascota(
        nombre: 'luna-gato', tipo: 'gato',
        chip: 'Sala-A-01', activo: true, alertas: 2,
        etiquetas: ['Vacunado', 'Esterilizado', 'Cariñoso'],
      ),
      const InfoMascota(
        nombre: 'max-perro', tipo: 'perro',
        chip: 'Patio-B-01', activo: true, alertas: 0,
        etiquetas: ['Vacunado', 'Juguetón', 'Mediano'],
      ),
      const InfoMascota(
        nombre: 'nube-conejo', tipo: 'conejo',
        chip: 'Sala-C-10', activo: true, alertas: 1,
        etiquetas: ['Tranquilo', 'Indoor'],
      ),
      const InfoMascota(
        nombre: 'kira-perro', tipo: 'perro',
        chip: 'Patio-B-20', activo: true, alertas: 3,
        etiquetas: ['Rescatado', 'Principal'],
      ),
      const InfoMascota(
        nombre: 'pico-ave', tipo: 'ave',
        chip: 'Aviario-05', activo: false, alertas: 0,
        etiquetas: ['Adoptado', 'Volador'],
      ),
    ];

    final totalAlertas = mascotas.fold(0, (s, d) => s + d.alertas);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Topología del Refugio'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.refresh),     onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Cabecera — Container con Row de ChipResumen (Pasos 1 + 3)
          Container(
            color:   Theme.of(context).colorScheme.surfaceContainerHighest,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                ChipResumenMp(
                  icono: Icons.pets,
                  texto: '${mascotas.length} mascotas',
                  color: Colors.indigo,
                ),
                const SizedBox(width: 16),
                ChipResumenMp(
                  icono: Icons.circle,
                  texto: '${mascotas.where((d) => d.activo).length} disponibles',
                  color: Colors.green,
                ),
                const SizedBox(width: 16),
                ChipResumenMp(
                  icono: Icons.warning_amber,
                  texto: '$totalAlertas alertas',
                  color: Colors.orange,
                ),
              ],
            ),
          ),

          // Lista — Expanded para que ocupe el espacio restante (Paso 3)
          Expanded(
            child: ListView.separated(
              padding:          const EdgeInsets.symmetric(vertical: 8),
              itemCount:        mascotas.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder:      (_, i)  => FilaMascota(mascota: mascotas[i]),
            ),
          ),
        ],
      ),
    );
  }
}
