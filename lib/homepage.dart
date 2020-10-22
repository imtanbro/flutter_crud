import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class SignOut extends StatefulWidget {
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Home Page"),
      body: Center(
          child: Container(
        child: GestureDetector(
            onTap: null,
             child: customButton(context, "SignOut")),
      )),
    );
  }
}