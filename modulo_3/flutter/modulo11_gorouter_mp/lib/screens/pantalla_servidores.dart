// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/models/servidor_ssh.dart';

class PantallaMascotas extends StatelessWidget {
  const PantallaMascotas({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final mascotas = mascotasSimuladas; // Lista de mascotas simuladas

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Mascotas'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount:   mascotas.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.pets),
          title:   Text(mascotas[i].nombre),
          onTap: () {
            // context.push() — apila la pantalla (aparece botón "atrás")
            context.push('/mascotas/${mascotas[i].id}', extra: mascotas[i]);
            // Navegar con extras — pasa el objeto completo evitando una segunda búsqueda
          },
        ),
      ),
    );
  }
}
