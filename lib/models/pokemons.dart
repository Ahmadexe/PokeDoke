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


class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': num,
      'name': name,
    };
  }

  factory NextEvolution.fromMap(Map<String, dynamic> map) {
    return NextEvolution(
      num: map['num'] != null ? map['num'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}

class PrevEvolution {
  String? num;
  String? name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': num,
      'name': name,
    };
  }

  factory PrevEvolution.fromMap(Map<String, dynamic> map) {
    return PrevEvolution(
      num: map['num'] != null ? map['num'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}
