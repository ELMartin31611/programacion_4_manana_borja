// lib/widgets/tarjetaservidorgrid.dart
import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class TarjetaMascotaGrid extends StatelessWidget {
  final Mascota  mascota;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaMascotaGrid({
    super.key,
    required this.mascota,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + favorito
            Row(children: [
              Icon(
                Icons.pets,
                color: mascota.vacunado ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  mascota.favorito ? Icons.star : Icons.star_border,
                  color: mascota.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Nombre y chip
            Text(
              mascota.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              mascota.chip,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),

            // Fila inferior: vacunado + especie + eliminar
            Row(children: [
              if (mascota.vacunado)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.health_and_safety, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  mascota.especie,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
