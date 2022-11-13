import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedoke/models/pokemons.dart';
import 'dart:convert';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends HydratedBloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState()) {
    on<AddToFavourites>(_addToFavourites);
  }
  
  _addToFavourites(AddToFavourites event, Emitter<FavouritesState> emit) {
    final state = this.state;
    emit(
      FavouritesState(
        favouritePokemons: List.from(state.favouritePokemons)..add(event.pokemon)
      )
    );
  }

  @override
  FavouritesState? fromJson(Map<String, dynamic> json) {
    return FavouritesState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(FavouritesState state) {
    return state.toMap();
  }
}
