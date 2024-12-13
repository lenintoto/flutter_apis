import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_provider.dart';
import 'models/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter PokeAPI Demo',
        home: PokemonListScreen(),
      ),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Búsqueda'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre del Pokémon',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final name = _searchController.text.toLowerCase().trim();
                    if (name.isNotEmpty) {
                      Provider.of<PokemonProvider>(context, listen: false)
                          .fetchPokemon(name);
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<PokemonProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.pokemon == null) {
                  return const Center(child: Text('Busca un Pokémon'));
                }

                Pokemon pokemon = provider.pokemon!;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        pokemon.sprites.frontDefault,
                        height: 400,
                        width: 400,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        pokemon.name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Altura: ${pokemon.height / 10} m'),
                      Text('Peso: ${pokemon.weight / 10} kg'),
                      const SizedBox(height: 8),
                      Text('Tipos: ${pokemon.types.join(", ")}'),
                      const SizedBox(height: 8),
                      Text('Habilidades: ${pokemon.abilities.join(", ")}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



