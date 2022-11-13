part of 'favourites_bloc.dart';

class FavouritesState {
  final List<Pokemon> favouritePokemons;
  FavouritesState({
    this.favouritePokemons = const <Pokemon>[],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favouritePokemons': favouritePokemons.map((x) => x.toJson()).toList(),
    };
  }

  factory FavouritesState.fromMap(Map<String, dynamic> map) {
    return FavouritesState(
      favouritePokemons: List<Pokemon>.from(map['favouritePokemons']?.map((x) => Pokemon.fromJson(x))),
    );
  }

}
