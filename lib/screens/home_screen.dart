import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedoke/cubits/pokemons_cubit/cubit/pokemons_cubit.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/user_cubit.dart';
import 'package:pokedoke/static/colors.dart';
import 'package:pokedoke/widgets/poke_card.dart';
import 'package:pokedoke/widgets/poke_categories_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    await BlocProvider.of<PokemonsCubit>(context).loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      drawer: Drawer(
        backgroundColor: secondaryColor,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: scaffoldBackgroundColor,
              child: Text(
                context.read<UserCubit>().state.user.userName![0],
                style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              context.read<UserCubit>().state.user.userName!,
              style: TextStyle(fontSize: 16, color: scaffoldBackgroundColor),
            ),
            ListTile(
              tileColor: secondaryColor,
              onTap: () {
                // TODO: Implement the page with updated arch
                // Navigator.of(context).pop();
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (_) => FavouritePokemonsScreen())
                // );
              },
              leading: Icon(
                Icons.favorite,
                color: scaffoldBackgroundColor,
              ),
              title: Text(
                "View Favourites",
                style: TextStyle(color: scaffoldBackgroundColor),
              ),
            ),
            ListTile(
              tileColor: secondaryColor,
              onTap: () {
                context.read<UserCubit>().logout();
              },
              leading: Icon(
                Icons.logout,
                color: scaffoldBackgroundColor,
              ),
              title: Text(
                "Log out?",
                style: TextStyle(color: scaffoldBackgroundColor),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        toolbarHeight: 100,
        iconTheme: IconThemeData(
          size: 25,
          color: secondaryColor,
        ),
        title: Text(
          "PokeDoke",
          style: TextStyle(color: secondaryColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: context.read<PokemonsCubit>().state is PokemonsLoading
          ? Center(
              child: CircularProgressIndicator(
                color: secondaryColor,
              ),
            )
          : BlocBuilder<PokemonsCubit, PokemonsState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 6,
                            children: [
                              CategoryCard(
                                image: "pikachu.jpg",
                                title: "Electric",
                                onPressed: () {},
                              ),
                              CategoryCard(
                                image: "charizard.jpg",
                                title: "Fire",
                                onPressed: () {},
                              ),
                              CategoryCard(
                                image: "mewtwo.jpg",
                                title: "Psychic",
                                onPressed: () {},
                              ),
                              CategoryCard(
                                image: "water.jpg",
                                title: "Water",
                                onPressed: () {},
                              ),
                              CategoryCard(
                                image: "poison.jpg",
                                title: "Poison",
                                onPressed: () {},
                              ),
                              CategoryCard(
                                image: "rockPokemon.jpg",
                                title: "Rock",
                                onPressed: () {},
                              ),
                              CategoryCard(
                                image: "ghost.jpg",
                                title: "Ghost",
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: state.pokemons.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return PokeCard(
                                pokemon: state.pokemons[index],
                              );
                            }),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
