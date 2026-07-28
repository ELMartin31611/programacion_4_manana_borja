// lib/router/app_router_paso4.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/scaffoldconnav.dart';
import '../screens/pantalla_servidores.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantallametricas.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/mascotas',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute — mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/mascotas',
          builder: (_, __) => const PantallaMascotas(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id      = state.pathParameters['id']!;
                final mascota = state.extra as Mascota?;
                return PantallaDetalle(id: id, mascota: mascota);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (_, __) => const PantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
      
      ],
    ),
  ],
);
