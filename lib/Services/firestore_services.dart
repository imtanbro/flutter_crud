import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    displayToastMessage(e.toString());
    return false;
  }
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
    displayToastMessage(e.toString());
    print(e.toString());
    return false;
  }
}

displayToastMessage(String message) {
  Fluttertoast.showToast(msg: message);
}

class DatabaseService {

  Future<void> addTeachersData(Map teachersData, String teacherId) async {
    await FirebaseFirestore.instance
        .collection("Teachers Data")
        .doc(teacherId)
        .set(teachersData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addStudentsData(Map studentsData, String studentId) async {
    await FirebaseFirestore.instance
        .collection("Students Data")
        .doc(studentId)
        .set(studentsData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addStudent(Map studentsData, String studentId, String branch, String sem, String div,) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch).collection(sem).doc(div).collection()
        .set(studentsData)
        .catchError((e) {
      print(e.toString());
    });
  }


}
