// Caminho: lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/muscle.dart';

class ApiService {
  final String baseUrl =
      'http://localhost:3000'; // A URL do seu servidor json-server

  // Função para buscar os músculos
  Future<List<Muscle>> fetchMuscles() async {
    final response = await http.get(Uri.parse('$baseUrl/muscles'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Muscle.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar músculos');
    }
  }
}
