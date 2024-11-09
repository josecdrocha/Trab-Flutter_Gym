import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../models/muscle.dart';

class ExerciseForm extends StatefulWidget {
  final Muscle muscle;

  ExerciseForm({required this.muscle});

  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Exercício'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Exercício'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gerar um ID para o novo exercício
                final newExercise = Exercise(
                  id: widget.muscle.exercises.length +
                      1, // Gerando um ID com base na quantidade de exercícios
                  name: _nameController.text,
                  description: _descriptionController.text,
                );

                setState(() {
                  widget.muscle.exercises
                      .add(newExercise); // Adiciona o exercício à lista
                });

                Navigator.pop(context); // Volta para a tela de exercícios
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
