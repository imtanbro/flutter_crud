import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Profile"),
      
      
    );
  }
}