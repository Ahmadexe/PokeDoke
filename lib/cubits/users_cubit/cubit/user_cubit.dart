import 'dart:convert';
import 'dart:math';

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
class UserCubit extends HydratedCubit<UserState> {
  UserCubit()
      : super(UserInitial(
            user: UserModel(
                isLoggedIn: false,
                isSignedUp: false,
                userEmail: null,
                userId: null,
                userName: null,
                userPassword: null)));

  logout() async {
    await UsersRepository.logout();
    UserModel currentState = state.user;
    currentState.isLoggedIn = false;
    emit(UserDefaultState(user: currentState));
  }

  signUpUser(String email, String password, String userName) async {
    UserModel currentState = state.user;
    currentState.userEmail = email;
    currentState.userPassword = password;
    currentState.userName = userName;
    emit(UserSignupLoading(user: currentState));
    String response = await UsersRepository.signup(currentState);
    if (response == 'success') {
      String _id = FirebaseAuth.instance.currentUser!.uid;
      currentState.userId = _id;
      currentState.userName = userName;
      currentState.isSignedUp = true;
      currentState.isLoggedIn = false;
      emit(UserSignedUp(user: currentState));
    } else {
      currentState.isSignedUp = false;
      currentState.isLoggedIn = false;
      emit(UserSignedupError(user: currentState));
    }
  }

  loginUser(String email, String password) async {
    UserModel currentState = state.user;
    currentState.userEmail = email;
    currentState.userPassword = password;
    emit(UserLoginLoading(user: currentState));
    String response = await UsersRepository.login(currentState);
    if (response == 'success') {
      String _id = FirebaseAuth.instance.currentUser!.uid;
      String _name = await UsersRepository.getUsername(_id);
      currentState.isSignedUp = true;
      currentState.isLoggedIn = true;
      currentState.userId = _id;
      currentState.userName = _name;
      currentState.userEmail = email;
      currentState.userPassword = password;
      emit(UserLoggedIn(user: currentState));
    } else {
      emit(UserLoginError(user: currentState));
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
