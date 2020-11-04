import 'package:flutter/material.dart';
import 'package:flutter_crud/Student/HomeScreen/CRUD/firestoreCRUDpage.dart';
import 'package:flutter_crud/Student/HomeScreen/Coffee/main.dart';
import 'package:flutter_crud/Student/HomeScreen/Dynamic%20Form/multi_form.dart';
import 'package:flutter_crud/Student/HomeScreen/Sqflite/SqfliteCRUD.dart';
import 'package:flutter_crud/Student/HomeScreen/Todo/todo.dart';
import 'package:flutter_crud/Student/Profile/profile.dart';
import 'package:flutter_crud/Teacher/Register/auth.dart';
import 'package:flutter_crud/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  String branch, div, sem, sId;
  HomePage({this.branch, this.div, this.sId, this.sem});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  context.read<AuthService>().signOut();
                },
                child: Icon(Icons.logout)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(children: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MultiForm()));
              },
              child: customButton(context, "Dynamic button", 10)),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirestoreCRUDPage()));
              },
              child: customButton(context, "CRUD", 10)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: customButton(context, "Profile", 10)),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Coffee()));
              },
              child: customButton(context, "Coffee", 10)),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SqlfliteCRUD()));
              },
              child: customButton(context, "SqFlite CRUD", 10)),

          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageTodo()));
              },
              child: customButton(context, "Todo", 10)),
        ]),
      ),
    );
  }
}
