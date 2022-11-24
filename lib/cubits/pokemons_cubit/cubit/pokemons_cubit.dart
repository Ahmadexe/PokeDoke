import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedoke/cubits/pokemons_cubit/cubit/repository_pokemons.dart';
import 'package:pokedoke/models/pokemons.dart';

part 'pokemons_state.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(const PokemonsInitial(pokemons: []));

  loadPokemons() async {
    try {
      var currentState = state.pokemons;
      emit(PokemonsLoading(pokemons: currentState));
      Pokemons pokemons = await PokemonsRepository.getPokemons();
      currentState = pokemons.pokemon!;
      print(currentState);
      emit(PokemonsLoaded(pokemons: currentState));
    } catch (e) {
      emit(const PokemonsError(pokemons: []));
    }
  }
}
