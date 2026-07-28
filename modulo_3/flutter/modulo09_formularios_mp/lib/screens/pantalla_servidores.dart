// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/widgets/tarjetaservidorgrid.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';

class PantallaMascotas extends StatefulWidget {
  const PantallaMascotas({super.key});
  @override
  State<PantallaMascotas> createState() => _PantallaMascotasState();
}

class _PantallaMascotasState extends State<PantallaMascotas> {
  final _mascotas = [
    Mascota(id:'1', nombre:'luna-01',raza: 'Labrador',  chip:'10.0.2.10',   edad:22,   refugio:'huellas',   especie:'Perro Labrador', vacunado:true,  favorito:true),
    Mascota(id:'2', nombre:'max-02',raza: 'Gato Persa',   chip:'10.0.2.20',   edad:22,   refugio:'patitas', especie:'Gato Persa',    vacunado:true),
    Mascota(id:'3', nombre:'mishi-03',raza: 'Labrador',  chip:'10.0.3.10',   edad:2222, refugio:'refugio',   especie:'Perro Labrador', vacunado:false),
    Mascota(id:'4', nombre:'rocky-04',raza: 'Conejo Holandés',  chip:'192.168.1.5', edad:22,   refugio:'campo',  especie:'Conejo Holandés', vacunado:false),
    Mascota(id:'5', nombre:'nube-05',raza: 'Ave Canaria',  chip:'192.168.1.5', edad:22,   refugio:'volar',  especie:' Ave Canaria', vacunado:true),
    
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleFavorito(int i) =>
      setState(() => _mascotas[i].favorito = !_mascotas[i].favorito);

  void _eliminar(int i) => setState(() => _mascotas.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${_mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _mascotas.length,
              itemBuilder: (ctx, i) => TarjetaMascotaGrid(
                mascota:   _mascotas[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _mascotas.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaMascota(
                mascota:   _mascotas[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}
