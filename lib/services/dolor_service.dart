import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/dolor_model.dart';

class DolorService {
  static const String _baseUrl =
      'https://alivia-dolores-api.vercel.app/dolencias';

  Future<List<Dolor>> obtenerDolencias() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> dolenciasJson = jsonData['data'];

        return dolenciasJson.map((json) => Dolor.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar dolencias: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
