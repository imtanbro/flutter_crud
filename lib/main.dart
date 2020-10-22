import 'package:flutter/material.dart';
import 'package:flutter_crud/Login/login.dart';
import 'package:flutter_crud/Signup/signup.dart';
import 'package:flutter_crud/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignOut(),
      routes: <String, WidgetBuilder> {
        '/landingpage' : (BuildContext context) => MyApp(),
        // '/signup' : (BuildContext context) => SignUp(),
        // '/homepage' : (BuildContext context) => SignOut(),
      },
    );
  }
}

