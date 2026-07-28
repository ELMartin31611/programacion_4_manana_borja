// lib/widgets/fila_servidor.dart
import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class FilaMascota extends StatelessWidget {
  final Mascota mascota;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaMascota({
    super.key,
    required this.mascota,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: mascota.vacunado
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.pets,
          color: mascota.vacunado ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),

      title: Text(
        mascota.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${mascota.refugio}@${mascota.chip}:${mascota.edad}',
            style: TextStyle(
              fontSize: 12,
              color: cs.onSurfaceVariant,
            ),
          ),
          Text(
            mascota.raza,
            style: TextStyle(
              fontSize: 10,
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              mascota.favorito ? Icons.star : Icons.star_border,
              color: mascota.favorito ? Colors.amber : cs.outline,
            ),
            onPressed: onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip: mascota.favorito
                ? 'Quitar favorito'
                : 'Agregar a favoritos',
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: cs.error,
            ),
            onPressed: onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip: 'Eliminar',
          ),
        ],
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
    );
  }
}
