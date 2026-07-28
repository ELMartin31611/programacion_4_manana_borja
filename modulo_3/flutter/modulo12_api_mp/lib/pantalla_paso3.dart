// lib/pantalla_paso3.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'producto.dart';
import 'producto_dto.dart';

class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<Mascota>> _fetchMascotas() async {
    final res = await http.get(
      Uri.parse(
          'https://api.escuelajs.co/api/v1/products?limit=20&offset=0'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => MascotaDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · API real'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<Mascota>>(
        future: _fetchMascotas(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final mascotas = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: mascotas.length,
            itemBuilder: (context, i) {
              final p = mascotas[i];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        p.activo ? Colors.green[100] : Colors.grey[200],
                    child: Text(
                      p.id.toString(),
                      style: TextStyle(
                        color: p.activo ? Colors.green[800] : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text(p.nombre),
                  subtitle: Text(p.categoria ?? 'Sin especie'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${p.precio.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        p.activo ? 'Disponible' : 'Adoptada',
                        style: TextStyle(
                          color: p.activo ? Colors.green : Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
