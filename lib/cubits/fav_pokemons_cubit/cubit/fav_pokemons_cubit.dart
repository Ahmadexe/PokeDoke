import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pokedoke/models/pokemon.dart';
import 'package:pokedoke/models/pokemons.dart';

part 'fav_pokemons_state.dart';

class FavPokemonsCubit extends HydratedCubit<FavPokemonsState> {
  FavPokemonsCubit() : super(const FavPokemonsState(pokemons: [], uId: []));
  
  addPokemons(Pokemon pokemon, String userId) {
    final state = this.state;
    List<Pokemon>? favs = List.from(state.pokemons!)..add(pokemon);
    List<String>? users = List.from(state.uId!)..add(userId);
    emit(FavPokemonsSuccesfullyAdded(pokemons: favs, uId: users));
    emit(FavPokemonsState(pokemons: favs, uId: users));
  }

  deletePokemons(Pokemon pokemon) {
    final state = this.state;
    var favourites = state.pokemons!;
    var users = state.uId!;
    for (int i = 0; i < favourites.length; i++) {
      if (favourites[i].isEqual(pokemon)) {
        favourites.removeAt(i);
        users.removeAt(i);
        break;
      }
    }
    emit(FavPokemonsSuccesfullyDeleted(pokemons: favourites, uId: users));
    emit(FavPokemonsState(pokemons: favourites, uId: users));
  }

  @override
  FavPokemonsState? fromJson(Map<String, dynamic> json) {
    return FavPokemonsState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(FavPokemonsState state) {
    return state.toMap();
  }
}
