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

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) => UserState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [user];
}

@immutable
class UserInitial extends UserState {
  const UserInitial({required super.user});
  factory UserInitial.fromMap(Map<String, dynamic> map) {
    return UserInitial(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}


class UserLoginLoading extends UserState {
  const UserLoginLoading({required super.user});
}

class UserLoggedIn extends UserState {
  factory UserLoggedIn.fromMap(Map<String, dynamic> map) {
    return UserLoggedIn(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }
  const UserLoggedIn({required super.user});
}

class UserLoginError extends UserState {
  UserLoginError({required super.user});
}

@immutable
class UserSignupLoading extends UserState {
  const UserSignupLoading({required super.user});
}

@immutable
class UserSignedUp extends UserState {
  factory UserSignedUp.fromMap(Map<String, dynamic> map) {
    return UserSignedUp(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }
  const UserSignedUp({required super.user});
}

class UserSignedupError extends UserState{
  UserSignedupError({required super.user});
}

class UserDefaultState extends UserState {
  factory UserDefaultState.fromMap(Map<String, dynamic> map) {
    return UserDefaultState(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  const UserDefaultState({required super.user});
}
