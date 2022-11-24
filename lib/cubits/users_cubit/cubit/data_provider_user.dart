import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedoke/models/user_model.dart';

class UsersDataProvider {
  static Future<String> provideLogin(UserModel user) async {
    String msg = 'An error occured';
    debugPrint("Here1");
    try {
    debugPrint("Here2");

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.userEmail!, password: user.userPassword!);
    debugPrint("Here3");
      
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not found';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      }
    }
    return msg;
  }

  static Future<String> provideSignup(UserModel user) async {
    String msg = "Sign up failed.";
    try {
      UserCredential credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.userEmail!,
        password: user.userPassword!,
      );
      if (credentials.user != null) {
        user.userId = credentials.user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credentials.user!.uid)
            .set({
          'name': user.userName,
          'email': user.userEmail,
          'password': user.userPassword,
          'id': user.userId,
        });
        return "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email is already in use.';
      }
    }
    return msg;
  }

  static getUsername(String documentId) async {
    String name = "Initial";
    await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: documentId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        name = doc["name"];
      });
    });
    return name;
  }

  static provideLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}
