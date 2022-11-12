import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedoke/constants/colors.dart';
import 'package:pokedoke/models/pokemons.dart';

class PokeDetailsScreen extends StatefulWidget {

  final Pokemon pokemon;
  final Color color;
  const PokeDetailsScreen({required this.color,required this.pokemon ,super.key});

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: scaffoldBackgroundColor,), onPressed: () {
          Navigator.of(context).pop();
        },),
      ),
      body: Stack(
        children: [
          
          Positioned(
            bottom: 0,
            // This is the main info container
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: scaffoldBackgroundColor 
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            left: MediaQuery.of(context).size.width * 0.35,
            child: CachedNetworkImage(
              imageUrl: widget.pokemon.img!,
              height: 130,
              fit: BoxFit.fitHeight,
            )
          ),
        ],
      ),
    );
  }
}