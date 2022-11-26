import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedoke/cubits/pokemons_cubit/cubit/data_provider_pokemons.dart';
import 'package:pokedoke/models/pokemons.dart';

class PokemonsRepository {

  static final cache = Hive.box('pokemons');

  static Future<Pokemons> getPokemons() async {
    print("Coming from API");
    Map<String, dynamic> json = await PokemonsDataProvider.getPokemons();
    Pokemons pokemons = Pokemons.fromJson(json);
    cache.put('pokes', pokemons);
    return pokemons;
  }

  static getPokemonsFromCache() {
    print("Coming from cache");
    List? pokemons = cache.get('pokes');

    if (pokemons == null) {
      return null;
    }
    List<Pokemons>? pokemon = List.generate(
        pokemons.length,
        (index) => pokemons[index],
    );
    return pokemon[0];
  }

}