import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Home Page"),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: customButton(context, "Dynamic button", 10)),
      ),
      
    );
  }
}