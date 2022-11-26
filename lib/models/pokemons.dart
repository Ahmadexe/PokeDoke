// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedoke/models/pokemon.dart';

part 'pokemons.g.dart';

@HiveType(typeId: 1)
class Pokemons extends HiveObject{
  @HiveField(0)
  List<Pokemon>? pokemon;

  Pokemons({this.pokemon});

  Pokemons.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


