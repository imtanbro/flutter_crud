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
            child: Column(
              children: [
                
                buildTextFormField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
