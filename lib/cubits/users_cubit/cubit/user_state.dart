// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {
  UserModel user;
  UserState({
    required this.user,
  });

  List<Object?> get props => [user];
}

class UserInitial extends UserState {
  UserInitial({required super.user});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserLoading extends UserState {
  UserLoading({required super.user});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UserLoggedIn extends UserState {
  UserLoggedIn({required super.user});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
