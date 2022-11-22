import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedoke/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit()
      : super(UserInitial(
            user: UserModel(
                isLoggedIn: false,
                isSignedUp: false,
                userEmail: null,
                userId: null,
                userName: null,
                userPassword: null))) {
    void signUpUser() => _signUpUser;
    void loginUser() => _loginUser;
  }

  _signUpUser(String email, String password) {
    // TODO: implement
  }
  _loginUser(String email, String password) {
    // TODO: implement
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
