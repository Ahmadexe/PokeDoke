import 'package:pokedoke/cubits/pokemons_cubit/cubit/data_provider_pokemons.dart';
import 'package:pokedoke/models/pokemons.dart';

class PokemonsRepository {
  static Future<Pokemons> getPokemons() async {
    Map<String, dynamic> json = await PokemonsDataProvider.getPokemons();
    return Pokemons.fromJson(json);
  }
}