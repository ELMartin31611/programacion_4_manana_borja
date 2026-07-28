// lib/screens/pantalla_dashboard.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'pantalla_servidores.dart';
import 'pantalla_metricas.dart';

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaDashboardAdopcion extends ConsumerWidget {
  const PantallaDashboardAdopcion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaMascotas(),
        1 => const PantallaEstados(),
        _ => const PantallaMascotas(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex:         indice,
        onDestinationSelected: (i) =>
            ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.pets),
            label:        'Mascotas',
          ),
          NavigationDestination(
            icon:         Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label:        'Estados',
          ),
        ],
      ),
    );
  }
}
