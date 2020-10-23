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


class Custombutoon extends StatefulWidget {
  @override
  _CustombutoonState createState() => _CustombutoonState();
}

class _CustombutoonState extends State<Custombutoon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          color: Colors.amber,
          height: 10,
          width: 100,
        )
      ],
      
    );
  }
}
