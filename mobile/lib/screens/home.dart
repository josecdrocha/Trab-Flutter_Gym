// Caminho: lib/screens/home.dart
import 'package:flutter/material.dart';

import 'listagem.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo à Academia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha uma parte do corpo para começar:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega para a tela de listagem de músculos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListagemPage(), // Passa a tela de listagem
                  ),
                );
              },
              child: Text('Ir para a Lista de Músculos'),
            ),
          ],
        ),
      ),
    );
  }
}
