// Caminho: lib/models/muscle.dart
import 'package:exercicios_app/models/exercise.dart';

class Muscle {
  final int id;
  final String name;
  final List<Exercise> exercises;

  Muscle({
    required this.id,
    required this.name,
    required this.exercises,
  });

  factory Muscle.fromJson(Map<String, dynamic> json) {
    var list = json['exercises'] as List;
    List<Exercise> exercisesList =
        list.map((i) => Exercise.fromJson(i)).toList();

    return Muscle(
      id: int.tryParse(json['id'].toString()) ??
          0, // Garantindo que o id seja int
      name: json['name'],
      exercises: exercisesList,
    );
  }
}
