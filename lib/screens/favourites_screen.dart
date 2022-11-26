import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedoke/cubits/fav_pokemons_cubit/cubit/fav_pokemons_cubit.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/user_cubit.dart';
import 'package:pokedoke/models/pokemon.dart';
import 'package:pokedoke/static/colors.dart';
import 'package:pokedoke/global/global_methods.dart';
import 'package:pokedoke/widgets/favourite_pokemon_tile.dart';

class FavouritePokemonsScreen extends StatefulWidget {
  const FavouritePokemonsScreen({super.key});

  @override
  State<FavouritePokemonsScreen> createState() =>
      _FavouritePokemonsScreenState();
}

class _FavouritePokemonsScreenState extends State<FavouritePokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavPokemonsCubit, FavPokemonsState>(
      builder: (context, state) {
        List<Pokemon> favPokemonsAll = state.pokemons! as List<Pokemon>;
        var users = state.uId!;
        String currentUser = context.read<UserCubit>().state.user.userId!;
        var favPokemons =
            getFilteredFavourites(favPokemonsAll, users, currentUser);
        return Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              size: 25,
              color: secondaryColor,
            ),
            backgroundColor: scaffoldBackgroundColor,
            elevation: 0,
            title: Text(
              "Favourite Pokemons",
              style: TextStyle(color: secondaryColor),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: favPokemons.length,
                  itemBuilder: (context, index) {
                    return FavouritePokemonTile(
                      pokemon: favPokemons[index],
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
