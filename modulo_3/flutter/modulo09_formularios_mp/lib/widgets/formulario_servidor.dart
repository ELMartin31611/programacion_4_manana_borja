// lib/widgets/formulario_servidor.dart
import 'package:flutter/material.dart';

class FormularioMascota extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioMascota({super.key, required this.onGuardar});

  @override
  State<FormularioMascota> createState() => _FormularioMascotaState();
}

class _FormularioMascotaState extends State<FormularioMascota> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlNombre  = TextEditingController();
  final _ctrlChip    = TextEditingController();
  final _ctrlEdad    = TextEditingController(text: '22');
  final _ctrlRefugio = TextEditingController(text: 'refugio');

  final _focusChip    = FocusNode();
  final _focusEdad    = FocusNode();
  final _focusRefugio = FocusNode();

  String _especie  = 'Perro Labrador';
  bool   _vacunado = true;

  // Expresión regular para validar código de chip (mismo formato IPv4)
  static final _regexChip = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlChip.dispose();
    _ctrlEdad.dispose();
    _ctrlRefugio.dispose();
    _focusChip.dispose();
    _focusEdad.dispose();
    _focusRefugio.dispose();
    super.dispose();
  }

  void _guardar() {
    // validate() llama al validator de TODOS los TextFormField del Form
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':  _ctrlNombre.text,
      'chip':    _ctrlChip.text,
      'edad':    _ctrlEdad.text,
      'refugio': _ctrlRefugio.text,
      'especie': _especie,
      'vacunado': _vacunado.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // ── Nombre de la mascota ──────────────────────────────────
          TextFormField(
            controller:      _ctrlNombre,
            decoration:      const InputDecoration(
              labelText:  'Nombre de la mascota',
              hintText:   'luna-01',
              prefixIcon: Icon(Icons.pets),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusChip.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3)                  return 'Mínimo 3 caracteres';
              if (!RegExp(r'^[a-zA-Z0-9\-\_]+$').hasMatch(v))
                return 'Solo letras, números, guiones y guiones bajos';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Código de chip ────────────────────────────────────────
          TextFormField(
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
            onFieldSubmitted: (_) => _focusEdad.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El chip es obligatorio';
              if (!_regexChip.hasMatch(v))  return 'Formato de chip inválido (ej. 192.168.1.10)';
              final octetos = v.split('.').map(int.parse).toList();
              if (octetos.any((o) => o > 255)) return 'Octeto fuera de rango (0–255)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Edad ──────────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlEdad,
            focusNode:       _focusEdad,
            decoration:      const InputDecoration(
              labelText:  'Edad (meses)',
              prefixIcon: Icon(Icons.cake_outlined),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusRefugio.requestFocus(),
            validator: (v) {
              final edad = int.tryParse(v ?? '');
              if (edad == null)              return 'Edad debe ser un número';
              if (edad < 1 || edad > 65535) return 'Edad entre 1 y 65535';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Refugio ───────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlRefugio,
            focusNode:       _focusRefugio,
            decoration:      const InputDecoration(
              labelText:  'Refugio',
              prefixIcon: Icon(Icons.home_outlined),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El refugio es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Especie — DropdownButtonFormField ─────────────────────
          DropdownButtonFormField<String>(
            value:      _especie,
            decoration: const InputDecoration(
              labelText:  'Especie / raza',
              prefixIcon: Icon(Icons.category),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Perro Labrador', 'Gato Persa', 'Conejo Holandés',
              'Ave Canaria', 'Hámster Sirio',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _especie = v!),
          ),
          const SizedBox(height: 8),

          // ── Vacunado — SwitchListTile ─────────────────────────────
          SwitchListTile(
            title:     const Text('Vacunado'),
            subtitle:  const Text('Tiene esquema de vacunación completo'),
            value:     _vacunado,
            onChanged: (v) => setState(() => _vacunado = v),
            secondary: const Icon(Icons.health_and_safety),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar mascota'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
