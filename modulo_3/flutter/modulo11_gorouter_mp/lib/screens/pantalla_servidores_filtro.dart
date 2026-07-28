// lib/screens/pantalla_servidores_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaMascotasFiltro extends StatelessWidget {
  final bool soloVacunado;
  const PantallaMascotasFiltro({super.key, this.soloVacunado = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloVacunado
        ? mascotasSimuladas.where((s) => s.vacunado).toList()
        : mascotasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Mascotas${soloVacunado ? ' (Vacunadas)' : ''}'),
        actions: [
          // Toggle filtro vacunado — cambia la URL con query param
          IconButton(
            icon:    Icon(soloVacunado ? Icons.vaccines : Icons.vaccines_outlined),
            tooltip: soloVacunado ? 'Ver todas' : 'Solo vacunadas',
            onPressed: () => soloVacunado
                ? context.go('/mascotas')
                : context.go('/mascotas?soloVacunado=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final s = filtrados[i];
          return ListTile(
            leading: Icon(Icons.pets, color: s.vacunado ? Colors.green : Colors.grey),
            title:   Text(s.nombre),
            subtitle: Text(s.chip),
            onTap: () => context.push(
              '/mascotas/${s.id}',
              extra: s,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}
