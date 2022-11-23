// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

@immutable
class UserState extends Equatable {
  final UserModel user;
  const UserState({
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [user];
}

@immutable
class UserInitial extends UserState {
  const UserInitial({required super.user});

  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class UserLoading extends UserState {
  const UserLoading({required super.user});
}

@immutable
class UserLoggedIn extends UserState {
  const UserLoggedIn({required super.user});
}

class UserSignedUp extends UserState {
  const UserSignedUp({required super.user});
}

class UserDefaultState extends UserState {
  const UserDefaultState({required super.user});
}
