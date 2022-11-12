import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedoke/api/pokemon_api_methods.dart';
import 'package:pokedoke/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:pokedoke/constants/colors.dart';
import 'package:pokedoke/database/cloud/firestore_methods.dart';
import 'package:pokedoke/models/pokemons.dart';
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
            appBar: AppBar(),
            body: _loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                    itemCount: pokemons.pokemon!.length,
                    itemBuilder: (context, index) {
                      return PokeCard(
                        pokemon: pokemons.pokemon![index],
                      );
                    }));
      },
    );
  }
}
