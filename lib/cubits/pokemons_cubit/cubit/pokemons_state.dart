// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemons_cubit.dart';

abstract class PokemonsState extends Equatable {
  final List<Pokemon> pokemons;
  const PokemonsState({
    required this.pokemons,
  });

  @override
  List<Object> get props => [];
}

class PokemonsLoading extends PokemonsState {
  const PokemonsLoading({required super.pokemons});
}

class PokemonsInitial extends PokemonsState {
  const PokemonsInitial({required super.pokemons});
}

class PokemonsLoaded extends PokemonsState {
  const PokemonsLoaded({required super.pokemons});
}

class PokemonsError extends PokemonsState {
  const PokemonsError({required super.pokemons});
}