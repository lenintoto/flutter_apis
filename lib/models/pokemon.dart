class Pokemon {
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;
  final PokemonSprites sprites;

  Pokemon({
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites']),
    );
  }
}

class PokemonSprites {
  final String frontDefault;

  PokemonSprites({required this.frontDefault});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      frontDefault: json['front_default'],
    );
  }
} 