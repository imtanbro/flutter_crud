import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class FirestoreCRUDPage extends StatefulWidget {
  @override
  _FirestoreCRUDPageState createState() => _FirestoreCRUDPageState();
}

class _FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
  String id, name;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  TextFormField buildTextFormField() {
    return TextFormField(
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
            builder: null,
          )
        ],
      ),
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection("CRUD").add({"Name": name});
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
}
