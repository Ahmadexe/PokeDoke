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
  List<NextEvolution>? nextEvolution;
  @HiveField(15)
  List<PrevEvolution>? prevEvolution;

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
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

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
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(NextEvolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolution>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(PrevEvolution.fromJson(v));
      });
    }
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
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution!.map((v) => v.toJson()).toList();
    }
    if (this.prevEvolution != null) {
      data['prev_evolution'] =
          this.prevEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, num: $num, name: $name, img: $img, type: $type, height: $height, weight: $weight, candy: $candy, egg: $egg, spawnChance: $spawnChance, avgSpawns: $avgSpawns, spawnTime: $spawnTime, weaknesses: $weaknesses, nextEvolution: $nextEvolution, prevEvolution: $prevEvolution)';
  }

  bool isEqual(Pokemon other) {
    return this.toString() == other.toString();
  }
}
