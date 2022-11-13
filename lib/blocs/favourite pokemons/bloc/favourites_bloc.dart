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
    on<DeleteFavourites>(_deleteFavourites);
  }
  
  _deleteFavourites(DeleteFavourites event, Emitter<FavouritesState> emit) {
    final state = this.state;
    var favourites = state.favouritePokemons;
    var users = state.uId;
    for (int i = 0; i < favourites.length; i++) {
      if (favourites[i].isEqual(event.pokemon)) {
        favourites.removeAt(i);
        users.removeAt(i);
        break;
      }
    }
    emit(FavouritesState(favouritePokemons: favourites, uId: users));
  }

  _addToFavourites(AddToFavourites event, Emitter<FavouritesState> emit) {
    final state = this.state;
    List<Pokemon> favs = List.from(state.favouritePokemons)..add(event.pokemon);
    List<String> users = List.from(state.uId)..add(event.uId);
    emit(
      FavouritesState(
        favouritePokemons: favs,
        uId: users
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
