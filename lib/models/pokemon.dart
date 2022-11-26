import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedoke/models/pokemons.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon extends HiveObject{
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String? num;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? img;
  @HiveField(5)
  List<String>? type;
  @HiveField(6)
  String? height;
  @HiveField(7)
  String? weight;
  @HiveField(8)
  String? candy;
  @HiveField(9)
  String? egg;
  @HiveField(10)
  dynamic spawnChance;
  @HiveField(11)
  dynamic avgSpawns;
  @HiveField(12)
  String? spawnTime;
  @HiveField(13)
  List<String>? weaknesses;
  @HiveField(14)

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.weaknesses,});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'];
    avgSpawns = json['avg_spawns'];
    spawnTime = json['spawn_time'];
    weaknesses = json['weaknesses'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['weaknesses'] = this.weaknesses;
    return data;
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, num: $num, name: $name, img: $img, type: $type, height: $height, weight: $weight, candy: $candy, egg: $egg, spawnChance: $spawnChance, avgSpawns: $avgSpawns, spawnTime: $spawnTime, weaknesses: $weaknesses)';
  }

  bool isEqual(Pokemon other) {
    return this.toString() == other.toString();
  }
}
