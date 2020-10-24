import 'package:flutter/material.dart';
import 'package:flutter_crud/Services/auth.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Authentication",
      home: Authentication(),      
      debugShowCheckedModeBanner: false,
    );
  }
}