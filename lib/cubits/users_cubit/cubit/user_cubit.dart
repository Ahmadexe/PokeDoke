import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/repository.dart';
import 'package:pokedoke/database/cloud/firestore_methods.dart';
import 'package:pokedoke/models/user_model.dart';
import 'package:pokedoke/widgets/snackbar.dart';

part 'user_state.dart';

const mounted = true;

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

  _signUpUser(String email, String password, String userName,
      BuildContext context) async {
    UserModel currentState = state.user;
    currentState.userEmail = email;
    currentState.userPassword = password;
    emit(UserLoading(user: currentState));
    String response = await UsersRepository.signup(currentState);
    if (response == 'success') {
      String _id = FirebaseAuth.instance.currentUser!.uid;
      currentState.userId = _id;
      currentState.userName = userName;
      currentState.isSignedUp = true;
      currentState.isLoggedIn = false;
      if (mounted) {
        displaySnackbar(
            context, 'success', "Thank you for registring $userName!");
      }
      emit(UserSignedUp(user: currentState));
    } else {
      currentState.isSignedUp = false;
      currentState.isLoggedIn = false;
      if (mounted) {
        displaySnackbar(context, 'error', response);
      }
      emit(UserDefaultState(user: currentState));
    }
  }

  _loginUser(String email, String password, BuildContext context) async {
    UserModel currentState = state.user;
    currentState.userEmail = email;
    currentState.userPassword = password;
    emit(UserLoading(user: currentState));
    String response = await UsersRepository.login(currentState);
    if (response == 'success') {
      String _id = FirebaseAuth.instance.currentUser!.uid;
      String _name = await getUserName(_id);
      currentState.isSignedUp = true;
      currentState.isLoggedIn = true;
      currentState.userId = _id;
      currentState.userName = _name;
      currentState.userEmail = email;
      currentState.userPassword = password;
      emit(UserLoggedIn(user: currentState));
    } else {
      currentState.isLoggedIn = false;
      if (response == "Wrong password") {
        currentState.isSignedUp = true;
      } else {
        currentState.isSignedUp = false;
      }
      if (mounted) {
        displaySnackbar(context, 'error', response);
      }
      emit(UserDefaultState(user: currentState));
    }
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
