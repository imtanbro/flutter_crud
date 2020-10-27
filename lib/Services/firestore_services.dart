import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crud/src/Model/entry.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  }
}

Future<bool> register(String email, String password) async {
  // try {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password);
  //   return true;
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'weak-password') {
  //     print("The password is too weak");
  //   } else
  //   //
  //   if (e is PlatformException) {
  //     if (e.code == "email-already-in-use" ||
  //         e.message ==
  //             "The email address is already in use by another account.") {
  //       print("The account already exists for that email");
  //     }
  //   }
  //   return false;
  // } Still got the error 10 

  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    print(e.toString());
    return false;
  }
}
