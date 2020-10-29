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
      bottomNavigationBar: Bottomnavbar(0),
      body: Container(color: Colors.black,),
      
    );
  }
}