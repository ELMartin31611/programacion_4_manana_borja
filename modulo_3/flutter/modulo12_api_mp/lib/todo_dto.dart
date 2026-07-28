// lib/todo_dto.dart
class RequisitoDto {
  final int id;
  final String title;
  final bool completed;

  const RequisitoDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory RequisitoDto.fromJson(Map<String, dynamic> json) => RequisitoDto(
    id:        json['id']        as int,
    title:     json['title']     as String,
    completed: json['completed'] as bool,
  );
}
