// lib/providers/metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor.dart';

class EstadosNotifier extends AsyncNotifier<List<EstadoMascota>> {
  // build() puede ser async — es la carga inicial
  @override
  Future<List<EstadoMascota>> build() => _fetch();

  Future<List<EstadoMascota>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      EstadoMascota(mascota:'luna-01', energia:45.2, sociabilidad:62.1, interesados:230, bienestar:125.0),
      EstadoMascota(mascota:'max-02',  energia:88.1, sociabilidad:91.2, interesados:80, bienestar:125.5),
      EstadoMascota(mascota:'mishi-03', energia:22.4, sociabilidad:41.0, interesados:50, bienestar:256.5),
      EstadoMascota(mascota:'rocky-04', energia:12.0, sociabilidad:32.5, interesados:10, bienestar:256.0),
      
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final estadosProvider =
    AsyncNotifierProvider<EstadosNotifier, List<EstadoMascota>>(
  EstadosNotifier.new,
);
