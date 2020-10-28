import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crud/src/Model/entry.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

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

  // await FirebaseAuth.instance
  //     .signInWithEmailAndPassword(email: email, password: password)
  //     .catchError((onError) {
  //   displayToastMessage("Error: " + onError.toString());
  // });

  
}

Future<bool> register(String email, String password) async {

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

displayToastMessage(String message) {
  Fluttertoast.showToast(msg: message);
}
