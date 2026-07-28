// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/formulario_servidor.dart';
import 'models/servidor_ssh.dart';
import 'widgets/fila_servidor.dart';
import 'screens/pantalla_servidores.dart';
import 'screens/pantalla_busqueda.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  TextField + TextEditingController + FocusNode       │
// │  2  Paso 2  Form + TextFormField + validación                   │
// │  3  Paso 3  Modelo + ListView.builder + ListTile acciones       │
// │  4  Paso 4  GridView.builder + toggle lista/grid                │
// │  5  Paso 5  SearchBar + filtrado en tiempo real                 │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 4;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaMascotas(),
    //5 => const PantallaBusquedaMascotas(),
    _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
  },
));

// ─── Paso 1 ────────────────────────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlNombre = TextEditingController();
  final _ctrlChip   = TextEditingController();
  final _ctrlEdad   = TextEditingController(text: '22');
  final _focusChip  = FocusNode();
  final _focusEdad  = FocusNode();

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlChip.dispose();
    _ctrlEdad.dispose();
    _focusChip.dispose();
    _focusEdad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Adopción de mascota'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlNombre,
              decoration:      const InputDecoration(
                labelText:  'Nombre',
                hintText:   'luna-01',
                prefixIcon: Icon(Icons.pets),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusChip.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlChip,
              focusNode:       _focusChip,
              decoration:      const InputDecoration(
                labelText:  'Código de chip',
                hintText:   '192.168.1.100',
                prefixIcon: Icon(Icons.qr_code),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusEdad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlEdad,
              focusNode:       _focusEdad,
              decoration:      const InputDecoration(
                labelText:  'Edad (meses)',
                prefixIcon: Icon(Icons.cake_outlined),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando a ${_ctrlNombre.text} '
                      '(${_ctrlChip.text}:${_ctrlEdad.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.favorite),
              label: const Text('Adoptar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombre.clear();
                _ctrlChip.clear();
                _ctrlEdad.text = '22';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Paso 2 ────────────────────────────────────────────────────────────
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nueva mascota'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioMascota(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} — ${datos['chip']}:${datos['edad']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─── Paso 3 ────────────────────────────────────────────────────────────
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _mascotas = [
    Mascota(id:'1', nombre:'luna-01',raza: 'Labrador',  chip:'10.0.2.10',   edad:22,   refugio:'huellas',   especie:'Perro Labrador', vacunado:true,  favorito:true),
    Mascota(id:'2', nombre:'max-02',raza: 'Gato Persa',   chip:'10.0.2.20',   edad:22,   refugio:'patitas', especie:'Gato Persa',    vacunado:true),
    Mascota(id:'3', nombre:'mishi-03',raza: 'Labrador',  chip:'10.0.3.10',   edad:2222, refugio:'refugio',   especie:'Perro Labrador', vacunado:false),
    Mascota(id:'4', nombre:'rocky-04',raza: 'Conejo Holandés',  chip:'192.168.1.5', edad:22,   refugio:'campo',  especie:'Conejo Holandés', vacunado:false),
    Mascota(id:'5', nombre:'nube-05',raza: 'Ave Canaria',  chip:'192.168.1.5', edad:22,   refugio:'volar',  especie:' Ave Canaria', vacunado:true),
    
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${_mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _mascotas.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pets_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin mascotas',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _mascotas.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaMascota(
                mascota:   _mascotas[i],
                onFavorito: () => setState(() =>
                    _mascotas[i].favorito = !_mascotas[i].favorito),
                onEliminar: () =>
                    setState(() => _mascotas.removeAt(i)),
              ),
            ),
    );
  }
}
