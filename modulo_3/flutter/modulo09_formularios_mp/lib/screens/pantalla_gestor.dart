// lib/screens/pantalla_gestor.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/widgets/tarjetaservidorgrid.dart';

import '../models/servidor_ssh.dart';
import '../widgets/formulario_servidor.dart';
import '../widgets/fila_servidor.dart';

class PantallaGestorAdopcion extends StatefulWidget {
  const PantallaGestorAdopcion({super.key});

  @override
  State<PantallaGestorAdopcion> createState() => _PantallaGestorAdopcionState();
}

class _PantallaGestorAdopcionState extends State<PantallaGestorAdopcion> {
  final _mascotas = [
    Mascota(
      id: '1',
      nombre: 'luna-01',
      raza: 'Labrador',
      chip: '10.0.2.10',
      edad: 22,
      refugio: 'huellas',
      especie: 'Perro Labrador',
      vacunado: true,
      favorito: true,
    ),
    Mascota(
      id: '2',
      nombre: 'max-02',
      raza: 'Gato Persa',
      chip: '10.0.2.20',
      edad: 22,
      refugio: 'patitas',
      especie: 'Gato Persa',
      vacunado: true,
    ),
    Mascota(
      id: '3',
      nombre: 'mishi-03',
      raza: 'Labrador',
      chip: '10.0.3.10',
      edad: 2222,
      refugio: 'refugio',
      especie: 'Perro Labrador',
      vacunado: false,
    ),
    Mascota(
      id: '4',
      nombre: 'rocky-04',
      raza: 'Conejo Holandés',
      chip: '192.168.1.5',
      edad: 22,
      refugio: 'campo',
      especie: 'Conejo Holandés',
      vacunado: false,
    ),
    Mascota(
      id: '5',
      nombre: 'nube-05',
      raza: 'Ave Canaria',
      chip: '192.168.1.5',
      edad: 22,
      refugio: 'volar',
      especie: 'Ave Canaria',
      vacunado: true,
    ),
  ];

  String _busqueda = '';
  bool _mostrarForm = false;
  bool _modoGrid = false;

  List<Mascota> get _filtrados {
    final texto = _busqueda.toLowerCase();

    return _mascotas.where((s) {
      return s.nombre.toLowerCase().contains(texto) ||
          s.chip.toLowerCase().contains(texto) ||
          s.refugio.toLowerCase().contains(texto) ||
          s.raza.toLowerCase().contains(texto);
    }).toList();
  }

  void _agregarMascota(Map<String, String> datos) {
    setState(() {
      _mascotas.add(
        Mascota(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          nombre: datos['nombre']!,
          raza: datos['raza'] ?? 'Mascota en adopción',
          chip: datos['chip']!,
          edad: int.parse(datos['edad']!),
          refugio: datos['refugio']!,
          especie: datos['especie']!,
          vacunado: datos['vacunado'] == 'true',
        ),
      );

      _mostrarForm = false;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Mascota "${datos['nombre']}" agregada'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _confirmarEliminar(Mascota s) async {
    final confirma = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.orange,
        ),
        title: const Text('Eliminar mascota'),
        content: Text('¿Eliminar "${s.nombre}" (${s.chip})?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirma == true) {
      setState(() {
        _mascotas.removeWhere((x) => x.id == s.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title: _mostrarForm
            ? const Text('Nueva mascota')
            : Text('Adopción (${_mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: _mostrarForm
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _mostrarForm = false;
                  });
                },
              )
            : null,
        actions: _mostrarForm
            ? []
            : [
                IconButton(
                  icon: Icon(
                    _modoGrid ? Icons.list : Icons.grid_view,
                  ),
                  onPressed: () {
                    setState(() {
                      _modoGrid = !_modoGrid;
                    });
                  },
                  tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
                ),
              ],
      ),

      body: _mostrarForm
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: FormularioMascota(
                onGuardar: _agregarMascota,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: SearchBar(
                    hintText: 'Buscar por nombre, chip, refugio o raza...',
                    leading: const Icon(Icons.search),
                    trailing: _busqueda.isNotEmpty
                        ? [
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _busqueda = '';
                                });
                              },
                            ),
                          ]
                        : null,
                    onChanged: (v) {
                      setState(() {
                        _busqueda = v;
                      });
                    },
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),

                if (_busqueda.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                      ),
                    ),
                  ),

                Expanded(
                  child: filtrados.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 56,
                                color: cs.onSurfaceVariant,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Sin resultados para "$_busqueda"',
                                style: TextStyle(
                                  color: cs.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _busqueda = '';
                                  });
                                },
                                child: const Text('Limpiar búsqueda'),
                              ),
                            ],
                          ),
                        )
                      : _modoGrid
                          ? GridView.builder(
                              padding: const EdgeInsets.all(12),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.1,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: filtrados.length,
                              itemBuilder: (ctx, i) {
                                final mascota = filtrados[i];

                                return TarjetaMascotaGrid(
                                  mascota: mascota,
                                  onFavorito: () {
                                    setState(() {
                                      mascota.favorito = !mascota.favorito;
                                    });
                                  },
                                  onEliminar: () {
                                    _confirmarEliminar(mascota);
                                  },
                                );
                              },
                            )
                          : ListView.separated(
                              itemCount: filtrados.length,
                              separatorBuilder: (_, __) => const Divider(
                                height: 1,
                                indent: 72,
                              ),
                              itemBuilder: (ctx, i) {
                                final mascota = filtrados[i];

                                return FilaMascota(
                                  mascota: mascota,
                                  onFavorito: () {
                                    setState(() {
                                      mascota.favorito = !mascota.favorito;
                                    });
                                  },
                                  onEliminar: () {
                                    _confirmarEliminar(mascota);
                                  },
                                );
                              },
                            ),
                ),
              ],
            ),

      floatingActionButton: _mostrarForm
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _mostrarForm = true;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Nueva mascota'),
            ),
    );
  }
}
