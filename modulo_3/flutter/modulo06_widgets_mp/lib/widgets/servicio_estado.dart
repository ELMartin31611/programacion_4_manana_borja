import 'package:flutter/material.dart';

class MascotaEstado extends StatefulWidget {
  final String nombre;
  const MascotaEstado({super.key, required this.nombre});

  @override
  State<MascotaEstado> createState() => _MascotaEstadoState();
}

class _MascotaEstadoState extends State<MascotaEstado> {
  bool _activo = true;
  int _reinicios = 0;
  String _nivel = 'normal';

  static const int _maxReinicios = 1;

  void _actualizarNivel() {
    if (_reinicios >= 2) {
      _nivel = 'critico';
    } else if (_reinicios >= 1) {
      _nivel = 'warning';
    } else {
      _nivel = 'normal';
    }
  }

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (_activo) _reinicios++;
      _actualizarNivel();
    });
  }

  void _reiniciarTodo() {
    setState(() {
      _activo = true;
      _reinicios = 0;
      _nivel = 'normal';
    });
  }

  Color _colorPorNivel() {
    if (_nivel == 'critico') return Colors.red;
    if (_nivel == 'warning') return Colors.orange;
    return _activo ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reinicios >= _maxReinicios;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _activo ? Icons.pets : Icons.pets_outlined,
            size: 72,
            color: _colorPorNivel(),
          ),
          const SizedBox(height: 8),

          Text(
            widget.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Text(
            _activo ? 'Disponible' : 'Adoptada',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontStyle: _activo ? FontStyle.normal : FontStyle.italic,
              color: _activo ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),

          if (!_activo)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'Ya tiene hogar',
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ],
              ),
            ),

          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_activo ? Icons.home : Icons.favorite),
            label: Text(_activo ? 'Marcar adoptada' : 'Volver a refugio'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _activo ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),

          TextButton(
            onPressed: _reiniciarTodo,
            child: const Text('Reiniciar ficha'),
          ),

          Opacity(
            opacity: enLimite ? 0.1 : 1.0,
            child: Text(
              'Cambios de estado: $_reinicios / $_maxReinicios',
              style: TextStyle(
                fontSize: 13,
                color: enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de cambios alcanzado',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
