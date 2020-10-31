import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class FirestoreCRUDPage extends StatefulWidget {
  @override
  _FirestoreCRUDPageState createState() => _FirestoreCRUDPageState();
}

class _FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
  String id, name, todo;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name : ${doc['Name']}"),
            Text("Todo : ${doc['Todo']}"),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () => updateData(doc),
                  child: Text(
                    "Update todo",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      initialValue: "My name is Tanmay",
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Name",
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.pink, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        decorationColor: Color.fromRGBO(66, 133, 244, 1),
      ),
      validator: (val) {
        if (val.isEmpty) {
          return "Please enter some text";
        }
      },
      onSaved: (newValue) => name = newValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("CRUD"),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildTextFormField(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: createData,
                child: Text(
                  "Create",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text(
                  "Read",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.blue,
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: db.collection("CRUD").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children:
                      snapshot.data.docs.map((doc) => buildItem(doc)).toList(),
                );
              } else
                return SizedBox();
            },
          )
        ],
      ),
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref =
          await db.collection("CRUD").add({"Name": name, "Todo": randomTodo()});
      setState(() {
        id = ref.id;
      });
      print(ref.id);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection("CRUD").doc(id).get();
    print(snapshot['Name']);
  }

  static Future<void> updateData(DocumentSnapshot doc) async {
    // final await FirebaseFirestore.instance.collection("CRUD").doc(doc.id).update({"Todo": "Please"});
    await FirebaseFirestore.instance
        .collection("CRUD")
        .doc(doc.id)
        .update({"Todo": "Please"});
  }

  Future<void> deleteData(DocumentSnapshot doc) async {
        await db.collection("CRUD").doc(doc.id).delete();
    setState(() {
      id = null;
    });
  }

  String randomTodo() {
    final randomNumber = randomAlphaNumeric(1);
    String todo;
    switch (int.parse(randomNumber)) {
      case 1:
        todo = "Like";
        break;
      case 2:
        todo = "Share";
        break;
      case 3:
        todo = "Do it";
        break;
      case 4:
        todo = "Make it";
        break;
      case 5:
        todo = "Help";
        break;
      case 6:
        todo = "Up";
        break;
      case 7:
        todo = "Down";
        break;
      case 8:
        todo = "Quit";
        break;
      case 9:
        todo = "Delete";
        break;
      case 0:
        todo = "Tanmay";
        break;
    }
    return todo;
  }
}
