// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'screens/pantalla_servidores.dart';
import 'screens/pantalla_busqueda.dart';
import 'screens/pantalla_metricas.dart';
import 'screens/pantalla_dashboard.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  ProviderScope + StateProvider básico (contador)     │
// │  2  Paso 2  NotifierProvider + lista de mascotas                │
// │  3  Paso 3  Provider derivado + búsqueda filtrada               │
// │  4  Paso 4  AsyncNotifierProvider + estados loading/error       │
// │  5  Paso 5  NavigationBar con dos tabs usando Riverpod          │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

// StateProvider — estado simple del Paso 1
final contadorProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: AppAdopcion()));
}

class AppAdopcion extends StatelessWidget {
  const AppAdopcion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const PantallaMascotas(),
        3 => const PantallaBusquedaMascotas(),
        4 => const PantallaEstados(),
        5 => const PantallaDashboardAdopcion(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

// ─── Paso 1 — vive en main.dart ──────────────────────────────────────
class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mascotas en adopción')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('mascotas disponibles'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
