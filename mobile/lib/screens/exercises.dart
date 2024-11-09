// Caminho: lib/screens/exercicios.dart
import 'package:flutter/material.dart';
import '../models/muscle.dart'; // Modelo de Muscle

class ExerciciosPage extends StatelessWidget {
  final Muscle muscle;

  // Recebe o músculo como parâmetro
  ExerciciosPage({required this.muscle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios - ${muscle.name}'),
      ),
      body: ListView.builder(
        itemCount: muscle.exercises.length, // Número de exercícios do músculo
        itemBuilder: (context, index) {
          final exercise = muscle.exercises[index]; // Exercício do músculo

          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(exercise.name),
              subtitle:
                  Text(exercise.description), // Exibe a descrição do exercício
            ),
          );
        },
      ),
    );
  }
}
