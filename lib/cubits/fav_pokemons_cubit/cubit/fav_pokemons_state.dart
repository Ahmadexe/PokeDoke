// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'fav_pokemons_cubit.dart';

class FavPokemonsState extends Equatable {
  final List<Pokemon> pokemons;
  final List<String> uId;

  const FavPokemonsState({
    required this.pokemons,
    required this.uId,
  });

  @override
  List<Object> get props => [];

 Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favouritePokemons': pokemons.map((x) => x.toJson()).toList(),
      'uId': uId,
    };
  }

  factory FavPokemonsState.fromMap(Map<String, dynamic> map) {
    return FavPokemonsState(
        pokemons: List<Pokemon>.from(
            map['favouritePokemons']?.map((x) => Pokemon.fromJson(x))),
        uId: List<String>.from(map['uId'] as List<String>));
  }
}
