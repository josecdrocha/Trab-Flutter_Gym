// Caminho: lib/models/exercise.dart
class Exercise {
  final int id;
  final String name;
  final String description;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
