import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedoke/cubits/pokemons_cubit/cubit/data_provider_pokemons.dart';
import 'package:pokedoke/models/pokemons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonsRepository {
  static final cache = Hive.box('pokemons');

  static var pref;

  static getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<Pokemons> getPokemons() async {
    Map<String, dynamic> json = await PokemonsDataProvider.getPokemons();
    Pokemons pokemons = Pokemons.fromJson(json);
    await getPref();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    pref.setString('date', date.toIso8601String());
    cache.put('pokes', pokemons);
    return pokemons;
  }

  static Future<Pokemons?> getPokemonsFromCache() async {
    Pokemons? pokemons = cache.get('pokes');
    if (pokemons == null) {
      return null;
    }

    await getPref();

    final dateInitialStr = pref.getString('date');
    DateTime dateInitial = DateTime.parse(dateInitialStr);
    DateTime now = DateTime.now();
    int daysPassed = now.difference(dateInitial).inDays;

    if (daysPassed >= 7) {
      pokemons = await getPokemons();
    }

    return pokemons;
  }
}
