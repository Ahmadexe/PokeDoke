import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedoke/models/pokemons.dart';

class FavouritePokemonTile extends StatelessWidget {
  final Pokemon pokemon;
  const FavouritePokemonTile({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: pokemon.img!,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(width: 10,),
              Column(children: [
                Text(pokemon.name!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text(pokemon.type![0], style: const TextStyle(fontSize: 16),)
              ],)
            ],
          )
        ],
      ),
    );
  }
}