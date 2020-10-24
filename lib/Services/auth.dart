import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Spacer(),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Something@email.com",
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            customButton(context, "Sign In" , 60),
            Spacer(),
          ],
        ),
      ),
    );
  }
}