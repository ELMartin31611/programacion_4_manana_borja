// lib/productos_repository.dart
import 'http_client.dart';
import 'producto.dart';
import 'producto_dto.dart';

class MascotasRepository {
  final HttpClient _client;
  const MascotasRepository(this._client);

  Future<List<Mascota>> listar({int limit = 20, int offset = 0}) async {
    final data = await _client.get('/products?limit=$limit&offset=$offset');
    return (data as List)
        .map((e) => MascotaDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  Future<List<Mascota>> buscar(String termino) async {
    final data = await _client.get('/products/?title=$termino');
    return (data as List)
        .map((e) => MascotaDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }
}
