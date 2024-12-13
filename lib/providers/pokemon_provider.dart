import 'package:flutter/foundation.dart';
import '../services/api_service.dart';
import '../models/pokemon.dart';

class PokemonProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  Pokemon? _pokemon;
  bool _isLoading = false;

  Pokemon? get pokemon => _pokemon;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemon(String name) async {
    _isLoading = true;
    notifyListeners();

    try {
      _pokemon = await _apiService.fetchPokemon(name.toLowerCase());
    } catch (e) {
      print('Error fetching pokemon: $e');
      _pokemon = null;
    }

    _isLoading = false;
    notifyListeners();
  }
} 