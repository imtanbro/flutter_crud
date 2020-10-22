import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud/src/Model/entry.dart';

class FireStoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get Entries
  Stream<List<Entry>> getEntries(){
    return _db
    .collection('entries')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => Entry.fromJson(doc.data()))
    .toList());
  }

  //Insert 



  //Update


  //Delete
}
