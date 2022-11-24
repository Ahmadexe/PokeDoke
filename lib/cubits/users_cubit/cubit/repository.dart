import 'package:pokedoke/cubits/users_cubit/cubit/data_provider_user.dart';
import 'package:pokedoke/models/user_model.dart';

class UsersRepository {
  static Future<String> login(UserModel user) => UsersDataProvider.provideLogin(user);

  static Future<String> signup(UserModel user) => UsersDataProvider.provideSignup(user);

  static logout() async {
    await UsersDataProvider.provideLogout();
  }
}
