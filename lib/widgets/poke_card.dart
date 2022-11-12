import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedoke/models/pokemons.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokeCard({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.greenAccent,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: Text(pokemon.name!) 
          ),
          Positioned(
            top: 45,
            left: 10,
            child: Text(pokemon.type![0]) 
          ),
          Positioned(
            bottom: 5,
            right: -10,
            child: CachedNetworkImage(
              imageUrl: pokemon.img!,
              height: 100,
              fit: BoxFit.fitHeight,
            )
          )
        ],
      ),
    );
  }
}