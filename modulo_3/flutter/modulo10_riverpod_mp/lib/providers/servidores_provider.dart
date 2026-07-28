// lib/providers/servidores_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/servidor_ssh.dart';

// NotifierProvider — estado complejo con métodos propios
class MascotasNotifier extends Notifier<List<Mascota>> {
  @override
  List<Mascota> build() => [
    Mascota(id:'1', nombre:'luna-01', chip:'10.0.2.10', edad:22,   vacunado:true,  favorito:true),
    Mascota(id:'2', nombre:'max-02',  chip:'10.0.2.20', edad:22,   vacunado:true),
    Mascota(id:'3', nombre:'mishi-03', chip:'10.0.3.10', edad:2222, vacunado:false),
    Mascota(id:'4', nombre:'rocky-04', chip:'10.0.3.10', edad:222, vacunado:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? Mascota(id:s.id, nombre:s.nombre, chip:s.chip,
                        edad:s.edad, vacunado:s.vacunado,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(Mascota mascota) {
    state = [...state, mascota];
  }
}

final mascotasProvider =
    NotifierProvider<MascotasNotifier, List<Mascota>>(
  MascotasNotifier.new,
);

final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final mascotasFiltradasProvider = Provider<List<Mascota>>((ref) {
  final todos    = ref.watch(mascotasProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.chip.contains(q)
  ).toList();
  // Cuando 'mascotasProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automáticamente.
});
