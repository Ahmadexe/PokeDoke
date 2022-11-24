import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pokedoke/models/pokemons.dart';

part 'fav_pokemons_state.dart';

class FavPokemonsCubit extends HydratedCubit<FavPokemonsState> {
  FavPokemonsCubit() : super(const FavPokemonsState(pokemons: [], uId: []));
  
  @override
  FavPokemonsState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  @override
  Map<String, dynamic>? toJson(FavPokemonsState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
