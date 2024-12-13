import "dart:convert";
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {
  final String baseUrl = "https://pokeapi.co/api/v2";

  Future<Pokemon> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$name'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
