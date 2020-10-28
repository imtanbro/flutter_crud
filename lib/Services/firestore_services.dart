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

  // try {
  //   await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password);
  //
  //   return true;
  // } catch (e) {
  //   authProblems errorType;
  //   if (Platform.isAndroid) {
  //     switch (e.message) {
  //       case 'There is no user record corresponding to this identifier. The user may have been deleted.':
  //         errorType = authProblems.UserNotFound;
  //         break;
  //       case 'The password is invalid or the user does not have a password.':
  //         errorType = authProblems.PasswordNotValid;
  //         break;
  //       case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
  //         errorType = authProblems.NetworkError;
  //         break;
  //       // ...
  //       default:
  //         print('Case ${e.message} is not yet implemented');
  //     }
  //   } else if (Platform.isIOS) {
  //     switch (e.code) {
  //       case 'Error 17011':
  //         errorType = authProblems.UserNotFound;
  //         break;
  //       case 'Error 17009':
  //         errorType = authProblems.PasswordNotValid;
  //         break;
  //       case 'Error 17020':
  //         errorType = authProblems.NetworkError;
  //         break;
  //       // ...
  //       default:
  //         print('Case ${e.message} is not yet implemented');
  //     }
  //   }
  //
  //   print('The error is $errorType');
  //   return false;
  // }
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
  // } Still got the error

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
