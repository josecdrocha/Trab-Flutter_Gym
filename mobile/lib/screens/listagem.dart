// Caminho: lib/screens/listagem.dart
import 'package:flutter/material.dart';
import '../models/muscle.dart';
import '../services/api_service.dart';
import 'exercises.dart'; // Tela para exibir os exercícios

class ListagemPage extends StatefulWidget {
  @override
  _ListagemPageState createState() => _ListagemPageState();
}

class _ListagemPageState extends State<ListagemPage> {
  late Future<List<Muscle>> muscles;

  @override
  void initState() {
    super.initState();
    muscles = ApiService().fetchMuscles(); // Carrega os músculos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Músculos'),
      ),
      body: FutureBuilder<List<Muscle>>(
        future: muscles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum músculo encontrado.'));
          }

          final muscles = snapshot.data!;

          return ListView.builder(
            itemCount: muscles.length,
            itemBuilder: (context, index) {
              final muscle = muscles[index];

              return ListTile(
                title: Text(muscle.name),
                onTap: () {
                  // Navega para a tela de exercícios do músculo selecionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciciosPage(muscle: muscle),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
