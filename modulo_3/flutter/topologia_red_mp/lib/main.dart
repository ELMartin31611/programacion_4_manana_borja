import 'package:flutter/material.dart';
import 'package:topologia_red_mp/widgets/pantalla_topologia.dart';


void main() => runApp(const AppTopologiaMp());

class AppTopologiaMp extends StatelessWidget {
  const AppTopologiaMp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:                      'Topología del Refugio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PantallaTopologiaMp(),
    );
  }
}
