import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedoke/models/user_model.dart';
import 'dart:convert';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc()
      : super(UserState(
            user: UserModel(
                userId: null,
                userName: null,
                userEmail: null,
                password: null,
                isLoggedIn: false))) {
    on<LoginUser>(_loginUser);
    on<SignupUser>(_signupUser);
  }
  
  _loginUser(LoginUser event, Emitter<UserState> emit) {

  }

  _signupUser(SignupUser event, Emitter<UserState> emit) {

  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
