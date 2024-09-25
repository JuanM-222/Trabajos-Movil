// lib/services/api_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/personaje.dart';

class ApiService {
  final String baseUrl = 'https://dragonball-api.com/api/characters';  // URL base de la API

  // Método para obtener los personajes con paginación
  Future<List<Personaje>> fetchPersonajes({int page = 2}) async {
    final url = '$baseUrl?page=$page&limit=10';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parseamos el cuerpo de la respuesta
      final Map<String, dynamic> data = json.decode(response.body);

      // Extraemos la lista de personajes del campo 'items'
      List<dynamic> personajesJson = data['items'];

      // Convertimos la lista de JSON en una lista de objetos Personaje
      return personajesJson.map((json) => Personaje.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar personajes');
    }
  }
}
