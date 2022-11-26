// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 0;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      id: fields[0] as dynamic,
      num: fields[1] as String?,
      name: fields[3] as String?,
      img: fields[4] as String?,
      type: (fields[5] as List?)?.cast<String>(),
      height: fields[6] as String?,
      weight: fields[7] as String?,
      candy: fields[8] as String?,
      egg: fields[9] as String?,
      spawnChance: fields[10] as dynamic,
      avgSpawns: fields[11] as dynamic,
      spawnTime: fields[12] as String?,
      weaknesses: (fields[13] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.num)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.img)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.candy)
      ..writeByte(9)
      ..write(obj.egg)
      ..writeByte(10)
      ..write(obj.spawnChance)
      ..writeByte(11)
      ..write(obj.avgSpawns)
      ..writeByte(12)
      ..write(obj.spawnTime)
      ..writeByte(13)
      ..write(obj.weaknesses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
