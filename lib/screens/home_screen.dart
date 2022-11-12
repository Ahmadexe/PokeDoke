import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedoke/api/pokemon_api_methods.dart';
import 'package:pokedoke/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:pokedoke/constants/colors.dart';
import 'package:pokedoke/database/cloud/firestore_methods.dart';
import 'package:pokedoke/models/pokemons.dart';
import 'package:pokedoke/services/authentications.dart';
import 'package:pokedoke/widgets/poke_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Pokemons pokemons;
  bool _loading = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      _loading = true;
    });
    pokemons = await ApiService().getPokemons();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
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
                      state.user.userName![0],
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
                    state.user.userName!,
                    style:
                        TextStyle(fontSize: 16, color: scaffoldBackgroundColor),
                  ),
                  ListTile(
                    tileColor: secondaryColor,
                    onTap: () {
                      context.read<UserBloc>().add(LogoutUser());
                    },
                    leading: Icon(
                      Icons.logout,
                      color: scaffoldBackgroundColor,
                    ),
                    title: Text("Log out?", style: TextStyle(color: scaffoldBackgroundColor),),
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
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              elevation: 0,
            ),
            body: _loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: pokemons.pokemon!.length,
                        itemBuilder: (context, index) {
                          return PokeCard(
                            pokemon: pokemons.pokemon![index],
                          );
                        }),
                  ));
      },
    );
  }
}
