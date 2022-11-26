import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedoke/cubits/fav_pokemons_cubit/cubit/fav_pokemons_cubit.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/user_cubit.dart';
import 'package:pokedoke/models/pokemon.dart';
import 'package:pokedoke/static/colors.dart';
import 'package:pokedoke/widgets/snackbar.dart';

class PokeDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;
  final Color color;
  const PokeDetailsScreen(
      {required this.color, required this.pokemon, super.key});

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: scaffoldBackgroundColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            child: Column(
              children: [
                Text(
                  widget.pokemon.name!,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: scaffoldBackgroundColor),
                ),
                Text(widget.pokemon.type![0],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: scaffoldBackgroundColor))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            // This is the main info container
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: scaffoldBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Height"),
                        Text(widget.pokemon.height!)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Weight"),
                        Text(widget.pokemon.weight!)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Weakness"),
                        Text(widget.pokemon.weaknesses!.join(", "))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Poke ID"),
                        Text(widget.pokemon.id.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Spawn chances"),
                        Text(widget.pokemon.spawnChance.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Egg"),
                        Text(widget.pokemon.egg.toString())
                      ],
                    ),
                    Expanded(child: Container()),
                    BlocListener<FavPokemonsCubit, FavPokemonsState>(
                      listener: (context, state) {
                        if (state is FavPokemonsSuccesfullyAdded) {
                          snackMessage(
                              "Success", "Pokemon added to favourites.");
                        }
                      },
                      child: BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<FavPokemonsCubit>().addPokemons(
                                    widget.pokemon, state.user.userId!);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          widget.color)),
                              child: const Text(
                                "Add to favourites!",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                      }),
                    )
                  ],
                ),
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
              )),
        ],
      ),
    );
  }

  snackMessage(String type, String message) {
    displaySnackbar(context, type, message);
  }
}
