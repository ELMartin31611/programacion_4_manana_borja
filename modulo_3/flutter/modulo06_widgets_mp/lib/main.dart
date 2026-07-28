// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo06_widgets_mp/widgets/catalogo_basicos.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'screens/pantalla_contexto.dart';
import 'widgets/indicador.dart';


// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo (adopción)             │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘

const int paso = 4;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  const Color.fromARGB(255, 0, 0, 0),          // ← cambia aquí
      brightness: Brightness.light,     // ← Brightness.dark para modo oscuro
    ),
    useMaterial3: true,
  ),
  home: switch (paso) { 

        1 => const Scaffold(
            body: Center(
              child: SaludoMp(),
            ),
          ),
        2 => const CatalogoBasicosMp(),
        3 => const Scaffold(
            body: Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  EtiquetaMp(texto: 'Disponible', color: Colors.green),
                  EtiquetaMp(texto: 'Adoptada', color: Colors.red, relleno: true),
                  EtiquetaMp(texto: 'En espera', color: Colors.orange),
                  EtiquetaMp(
                    texto: 'Urgente',
                    color: Colors.red,
                    fontSize: 16,
                    relleno: true,
                  ),
                  EtiquetaMp(
                    texto: 'Info',
                    color: Colors.blue,
                    fontSize: 11,
                  ),
                ],
              ),
            ),
          ),
          4 => const Scaffold(
            body: Center(
              child: MascotaEstado(nombre: 'Luna'),
            ),
          ),
          5 => Scaffold(                               // Paso 3b
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContadorLimitadoMp(
                    etiqueta: 'Solicitudes de adopción',
                    limite:   3,
                    color:    Colors.red,
                    onLimite: () => debugPrint('¡Cupo de solicitudes lleno!'),
                  ),
                  const SizedBox(height: 40),
                  ContadorLimitadoMp(
                    etiqueta: 'Visitas activas',
                    limite:   10,
                    color:    Colors.indigo,
                  ),
                ],
              ),
            ),
          ),
          6 => Scaffold(                              // Paso 4
            appBar: AppBar(title: const Text('Tiempo de visita')),
            body: const Center(child: RelojMp()),
          ),
          7 => const PantallaContextoMp(),
          8 => Scaffold(                             // Paso 6
            body: Center(
              child: Wrap(
                spacing:    32,
                runSpacing: 24,
                alignment:  WrapAlignment.center,
                children: const [
                  IndicadorMp(label: 'Mascotas disponibles', valor: '8',
                            color: Colors.green, icono: Icons.pets),
                  IndicadorMp(label: 'Adopciones urgentes',   valor: '2',
                            color: Colors.red,   icono: Icons.warning_amber,
                            subtitulo: 'Requieren atención'),
                  IndicadorMp(label: 'Donaciones',            valor: '4.2 mil',
                            color: Colors.indigo),
                  IndicadorMp(label: 'Tasa de adopción',             valor: '99.8%',
                            color: Colors.teal, subtitulo: 'Últimos 30 días'),
                ],
              ),
            ),
          ),
        _ => Scaffold(
            body: Center(
              child: Text('Paso $paso: crea el widget primero'),
            ),
          ),
      },
    ));

class SaludoMp extends StatelessWidget {
  const SaludoMp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Adoptar una mascota cambia dos vidas: la tuya y la de un animal que espera un hogar en el refugio. Cada adopción responsable da una segunda oportunidad a perros y gatos que merecen cariño, cuidado y una familia para siempre.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.indigo,
        shadows: [
          Shadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      overflow: TextOverflow.fade,
      maxLines: 2,
      softWrap: false,
      textAlign: TextAlign.justify,
    );
  }
}

class EtiquetaMp extends StatelessWidget {
  final String texto;
  final Color color;
  final bool relleno;
  final double fontSize;

  const EtiquetaMp({
    super.key,
    required this.texto,
    required this.color,
    this.relleno = false,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: relleno ? color : Colors.transparent,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: relleno ? Colors.white : color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
