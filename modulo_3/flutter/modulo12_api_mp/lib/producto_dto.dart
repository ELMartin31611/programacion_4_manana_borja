// lib/producto_dto.dart
import 'producto.dart';

class MascotaDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const MascotaDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory MascotaDto.fromJson(Map<String, dynamic> json) => MascotaDto(
    id:           json['id']            as int,
    name:         json['name']          as String,
    price:        json['price']         as String,
    isActive:     json['is_active']     as bool? ?? false,
    categoryName: json['category_name'] as String?,
  );

  Mascota toDomain() => Mascota(
    id:        id,
    nombre:    name,
    precio:    double.tryParse(price) ?? 0,
    activo:    isActive,
    categoria: categoryName,
  );
}
