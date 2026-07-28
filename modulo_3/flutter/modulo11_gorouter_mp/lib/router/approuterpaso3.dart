// lib/router/app_router_paso3.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_servidores_filtro.dart';
import '../screens/pantalla_detalle.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/mascotas',
      builder: (context, state) {
        // Query parameters — /mascotas?soloVacunado=true
        final soloVacunado = state.uri.queryParameters['soloVacunado'] == 'true';
        return PantallaMascotasFiltro(soloVacunado: soloVacunado);
      },
    ),
    GoRoute(
      path:    '/mascotas/:id',
      builder: (context, state) {
        final id      = state.pathParameters['id']!;
        final mascota = state.extra as Mascota?;
        return PantallaDetalle(id: id, mascota: mascota);
      },
    ),
  ],
);
