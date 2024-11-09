// Caminho: lib/components/muscle_card.dart
import 'package:flutter/material.dart';
import '../models/muscle.dart';

class MuscleCard extends StatelessWidget {
  final Muscle muscle;
  final VoidCallback onTap;

  MuscleCard({required this.muscle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(muscle.name),
        onTap: onTap,
      ),
    );
  }
}
