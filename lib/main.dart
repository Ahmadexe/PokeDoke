import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedoke/cubits/fav_pokemons_cubit/cubit/fav_pokemons_cubit.dart';
import 'package:pokedoke/cubits/pokemons_cubit/cubit/pokemons_cubit.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/user_cubit.dart';
import 'package:pokedoke/firebase_options.dart';
import 'package:pokedoke/models/pokemon.dart';
import 'package:pokedoke/models/pokemons.dart';
import 'package:pokedoke/screens/home_screen.dart';
import 'package:pokedoke/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  Hive.registerAdapter(PokemonsAdapter());
  await Hive.openBox('pokemons');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()), 
        BlocProvider(create: (context) => FavPokemonsCubit()),
        BlocProvider(create: (context) => PokemonsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state.user.isLoggedIn) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }

  getData() async {}
}
