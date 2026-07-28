// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp/models/servidor_ssh.dart';
import '../providers/servidores_provider.dart';

class PantallaMascotas extends ConsumerWidget {
  const PantallaMascotas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mascotas = ref.watch(mascotasProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: mascotas.isEmpty
          ? const Center(child: Text('Sin mascotas'))
          : ListView.separated(
              itemCount:        mascotas.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = mascotas[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.vacunado
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.pets,
                        color: s.vacunado ? Colors.green : Colors.grey),
                  ),
                  title:    Text(s.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${s.chip}:${s.edad}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(mascotasProvider.notifier)
                            .toggleFavorito(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(mascotasProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(mascotasProvider.notifier).agregar(
            Mascota(
              id:       id,
              nombre:   'nueva-mascota-$id',
              chip:     '192.168.0.${mascotas.length + 1}',
              edad:     22,
              vacunado: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
