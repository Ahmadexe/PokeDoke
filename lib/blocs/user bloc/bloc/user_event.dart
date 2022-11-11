// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoginUser implements UserEvent {
  UserModel user;
  LoginUser({
    required this.user,
  });
}

class SignupUser implements UserEvent {
  UserModel user;
  SignupUser({
    required this.user,
  });
}
