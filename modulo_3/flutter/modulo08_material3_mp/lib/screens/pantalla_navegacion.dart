
import 'package:flutter/material.dart';

class PantallaNavegacion extends StatefulWidget {
  const PantallaNavegacion({super.key});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Adopción de Mascotas'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboard(),
          _PantallaMascotas(),
          _PantallaAvisos(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.primaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Inicio',
          ),
          NavigationDestination(
            icon:         Icon(Icons.pets),
            selectedIcon: Icon(Icons.pets),
            label:        'Mascotas',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.notifications)),
            label:        'Avisos',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Ajustes',
          ),
        ],
      ),
    );
  }
}

// ─── Pantallas de cada pestaña ────────────────────────────────────────────

class _PantallaDashboard extends StatelessWidget {
  const _PantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen', style: text.headlineSmall),
        const SizedBox(height: 16),
        // Tarjetas de métricas
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Mascotas', valor: '8',  icono: Icons.pets,          color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Avisos',    valor: '3',  icono: Icons.notifications, color: cs.errorContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Adoptados',   valor: '42', icono: Icons.trending_up, color: cs.tertiaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Visitas',  valor: '1.2k', icono: Icons.visibility, color: cs.secondaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaMascotas extends StatelessWidget {
  const _PantallaMascotas();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading:  Icon(Icons.pets, color: cs.primary),
          title:    Text('mascota-0${i + 1}'),
          subtitle: Text('${i + 1} años · Disponible'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          onTap: () {},
        ),
      ),
    );
  }
}

class _PantallaAvisos extends StatelessWidget {
  const _PantallaAvisos();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const avisos = [
      (mascota: 'Luna',  mensaje: 'Vacuna pendiente',         nivel: 'URGENTE'),
      (mascota: 'Max', mensaje: 'Cita veterinaria',      nivel: 'AVISO'),
      (mascota: 'Michi', mensaje: 'Solicitud de adopción', nivel: 'URGENTE'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: avisos.length,
      itemBuilder: (ctx, i) {
        final aviso = avisos[i];
        final esUrgente = aviso.nivel == 'URGENTE';

        return Card(
          color: esUrgente ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esUrgente ? Icons.error : Icons.warning,
              color: esUrgente ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(aviso.mascota,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(aviso.mensaje),
            trailing: Chip(
              label: Text(aviso.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esUrgente ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esUrgente ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title:   Text('Privacidad'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Acerca de'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
