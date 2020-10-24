import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_crud/src/Model/entry.dart';

class FireStoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get Entries
  Stream<List<Entry>> getEntries() {
    return _db.collection('entries').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());
  }

  //Insert

  //Update

  //Delete
}

Future<void> signIn(String email, String password) async {}
Future<void> register(String email, String password) async {
  try {} on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print("The password is too weak");
    }
  } catch (e) {}
}
