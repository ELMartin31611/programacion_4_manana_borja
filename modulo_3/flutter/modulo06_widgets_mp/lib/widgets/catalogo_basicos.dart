import 'package:flutter/material.dart';

class CatalogoBasicosMp extends StatelessWidget {
  const CatalogoBasicosMp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos — adopción')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
                // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'Luna: Disponible para adopción',
            style: TextStyle(
              fontSize:      20,
              fontWeight:    FontWeight.bold,    // .w100–.w900  ·  .bold = .w700
              color:         Colors.green,
              letterSpacing: 0.5,
              fontStyle:     FontStyle.normal,   // .italic
              decoration:    TextDecoration.underline,
              shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]
              //             .underline  .lineThrough  .overline
            ),
            textAlign: TextAlign.justify,
            softWrap: false,
            maxLines: 2
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'max-refugio-norte-zona-centro → sin ficha aún',
              textAlign: TextAlign.center,        // .left  .right  .justify  .start  .end
              maxLines:  1,
              overflow:  TextOverflow.fade,   // .clip  .fade  .visible
              
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(children: [
              TextSpan(text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: 'URGENTE',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              TextSpan(text: ' — última revisión hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ]),
          ),
          const SizedBox(height: 8),

          // ── SelectableText — el usuario puede seleccionar y copiar ───────────
          const SelectableText(
            'Ficha #A-5432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.circle_outlined,  size: 35, color: Colors.green),
              Icon(Icons.favorite,        size: 40, color: Colors.red),
              Icon(Icons.star_rate_sharp, size: 45, color: Color.fromARGB(255, 216, 162, 81)),
              Icon(Icons.pets,           size: 80, color: Colors.indigo),
              Icon(Icons.stacked_bar_chart,      size: 40, color: Color.fromARGB(255, 170, 18, 18)),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(Icons.settings,
              size:          24,
              color:         Colors.blueGrey,
              semanticLabel: 'Configuración del refugio'),   // leído por lectores de pantalla
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
              FilledButton(  onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(    onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(onPressed: null,  child: const Text('Desactivado')),
              //             ↑ onPressed: null → desactiva el botón visualmente
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.stop, size: 18),
                label: const Text('Pausar'),
              ),
              IconButton(
                onPressed: () {},
                icon:     const Icon(Icons.settings),
                color:    Colors.indigo,
                iconSize: 28,
                tooltip: 'Gestiona todas las adopciones'
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation:   12,
              minimumSize: const Size(double.infinity, 0),  // ocupa todo el ancho
            ),
            child: const Text('Adopción urgente',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            
            child: ListTile(
              leading:  const Icon(Icons.pets, color: Colors.indigo),
              title:    const Text('Luna'),
              subtitle: const Text('Gata · 2 años · 45 días en refugio'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap:    () {},     
                    // toda la fila queda tocable
            ),
          ),
          Card(
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title:    const Text('puede servir para las notificaciones de adopción :3'),
              subtitle: const Text('sin ficha · Max'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          const Divider(height: 32),
          // Agrega a children: [ ... ]

          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              
              const Chip(label: Text('gato')),
              
              const Chip(
                padding: const EdgeInsets.all(8),
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('Vacunado'),
                backgroundColor: Colors.green,
                labelStyle:      TextStyle(color: Colors.white, fontSize: 12),
                
              ),
              FilterChip(
                label:      const Text('Esterilizado'),
                selected:   false,
                onSelected: (_) {},
              ),
              ActionChip(
                label:     const Text('Ver historial'),
                avatar:    const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),
          // Agrega a children: [ ... ]

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator()),           // value: null → animación continua
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       0.7,           // 70 %
                  color:       Colors.green,
                  strokeWidth: 6,
                )),
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       0.3,
                  color:       Colors.red,
                  strokeWidth: 3,
                  strokeCap:   StrokeCap.round,   // puntas redondeadas
                )),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(),                                  // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.7, color: Colors.indigo), // 60 %
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value:     1.0,
            color:     Colors.green,
            minHeight: 6,                     // barra más gruesa (default: 4)
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}
