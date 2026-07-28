// lib/router/app_router_paso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_servidores.dart';
import '../screens/pantalla_detalle.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/mascotas',
      builder: (context, state) => const PantallaMascotas(),
      routes: [
        // Ruta hija: /mascotas/:id
        GoRoute(
          path:    ':id',   // relativa — ruta completa: /mascotas/:id
          builder: (context, state) {
            final id      = state.pathParameters['id']!;
            final mascota = state.extra as Mascota?;
            return PantallaDetalle(id: id, mascota: mascota);
          },
        ),
        // Ruta hija: /mascotas/:id/historial
        GoRoute(
          path:    ':id/historial',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Historial de $id')),
              body:   Center(child: Text('Historial de la mascota $id')),
            );
          },
        ),
      ],
    ),
  ],
);
