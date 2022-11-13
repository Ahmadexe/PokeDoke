import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedoke/blocs/favourite%20pokemons/bloc/favourites_bloc.dart';
import 'package:pokedoke/constants/colors.dart';
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
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        var favPokemons = state.favouritePokemons;
        return Scaffold(
          backgroundColor: scaffoldBackgroundColor,

          appBar: AppBar(
            iconTheme: IconThemeData(
                size: 25,
                color: secondaryColor,
              ),
            backgroundColor: scaffoldBackgroundColor,
            elevation: 0,
            title: Text("Favourite Pokemons", style: TextStyle(color: secondaryColor),),
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
