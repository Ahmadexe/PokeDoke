// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonsAdapter extends TypeAdapter<Pokemons> {
  @override
  final int typeId = 1;

  @override
  Pokemons read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemons(
      pokemon: (fields[0] as List?)?.cast<Pokemon>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pokemons obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pokemon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
