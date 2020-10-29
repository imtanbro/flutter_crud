import 'package:flutter/material.dart';
import 'package:flutter_crud/Services/auth.dart';
import 'package:flutter_crud/Student/Signup/signup.dart';
import 'package:flutter_crud/src/Model/entry.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Authentication",
      home: EntryPage(),      
      debugShowCheckedModeBanner: false,
    );
  }
}