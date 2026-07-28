// lib/screens/pantalla_metricas.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor.dart';
import '../providers/metricas_provider.dart';

class PantallaEstados extends ConsumerWidget {
  const PantallaEstados({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estadosAsync = ref.watch(estadosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado de mascotas'),
        actions: [
          IconButton(
            icon:    const Icon(Icons.refresh),
            tooltip: 'Recargar',
            onPressed: () =>
                ref.read(estadosProvider.notifier).recargar(),
          ),
        ],
      ),
      body: estadosAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $e'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(estadosProvider.notifier).recargar(),
                icon:  const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (estados) => ListView.builder(
          padding:     const EdgeInsets.all(12),
          itemCount:   estados.length,
          itemBuilder: (_, i) => _TarjetaEstado(estado: estados[i]),
        ),
      ),
    );
  }
}

class _TarjetaEstado extends StatelessWidget {
  final EstadoMascota estado;
  const _TarjetaEstado({required this.estado});

  @override
  Widget build(BuildContext context) {
    final cs              = Theme.of(context).colorScheme;
    final energiaCritica  = estado.energia > 85;
    final socialCritica   = estado.sociabilidad > 90;
    final bienestarCritico = estado.bienestar < 20;
    final esCritico       = energiaCritica || socialCritica || bienestarCritico;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color:  esCritico ? cs.errorContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.pets, color: esCritico ? cs.error : cs.primary, size: 18),
              const SizedBox(width: 8),
              Text(estado.mascota,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('${estado.interesados} interesados',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
            ]),
            const SizedBox(height: 10),
            _Barra('Energía', estado.energia, energiaCritica),
            const SizedBox(height: 4),
            _Barra('Social', estado.sociabilidad, socialCritica),
            const SizedBox(height: 4),
            _Barra('Bienestar', estado.bienestar, bienestarCritico),
          ],
        ),
      ),
    );
  }
}

class _Barra extends StatelessWidget {
  final String label;
  final double valor;
  final bool   critica;
  const _Barra(this.label, this.valor, this.critica);

  @override
  Widget build(BuildContext context) {
    final color = critica ? Colors.red : Colors.green;
    return Row(children: [
      SizedBox(width: 64, child: Text(label,
          style: const TextStyle(fontSize: 12))),
      Expanded(
        child: LinearProgressIndicator(
          value:           valor / 100,
          backgroundColor: Colors.grey.shade200,
          valueColor:      AlwaysStoppedAnimation(color),
        ),
      ),
      const SizedBox(width: 8),
      Text('${valor.toStringAsFixed(1)}%',
          style: TextStyle(fontSize: 12, color: color,
              fontWeight: FontWeight.w600)),
    ]);
  }
}
