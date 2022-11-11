import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? password;
  bool isLoggedIn;
  
  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.password,
    required this.isLoggedIn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'password': password,
      'isLoggedIn': isLoggedIn,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] != null ? map['userId'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      isLoggedIn: map['isLoggedIn'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
