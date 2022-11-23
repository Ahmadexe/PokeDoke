import 'package:pokedoke/cubits/users_cubit/cubit/data_provider_user.dart';
import 'package:pokedoke/models/user_model.dart';

class UsersRepository {
  static Future<String> login(UserModel user) async {
    String response = await UsersDataProvider.provideLogin(user);
    return response;
  }

  static Future<String> signup(UserModel user) async {
    String response = await UsersDataProvider.provideSignup(user);
    return response;
  }

  static logout() async {
    await UsersDataProvider.provideLogout();
  }
}
