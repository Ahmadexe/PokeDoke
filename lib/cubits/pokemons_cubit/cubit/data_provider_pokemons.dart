import 'dart:convert';

import 'package:pokedoke/models/pokemons.dart';
import 'package:pokedoke/static/constants.dart';
import 'package:http/http.dart' as http;


class PokemonsDataProvider {

  static Future<Map<String, dynamic>> getPokemons() async {
    var client = http.Client();
    var uri = Uri.parse(pokeApi);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}