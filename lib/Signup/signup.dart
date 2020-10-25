import 'package:flutter/material.dart';
import 'package:flutter_crud/Services/firestore_services.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String first_name, middle_name, last_name, 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.black),
      child: Form(
        child: Column(
          children: [
            Spacer(),
            TextFormField(
              controller: _email,
              cursorColor: Colors.blue,
              autovalidate: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Username cannot be empty";
                } else
                  return null;
              },
              style: TextStyle(
                color: Color.fromRGBO(244, 180, 0, 1),
                decorationColor: Color.fromRGBO(66, 133, 244, 1),

                // backgroundColor: Colors.blue,
              ),
              decoration: InputDecoration(
                hintText: "Something@email.com",
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              cursorColor: Colors.blue,
              style: TextStyle(
                color: Color.fromRGBO(244, 180, 0, 1),
                decorationColor: Color.fromRGBO(66, 133, 244, 1),

                // backgroundColor: Colors.blue,
              ),
              decoration: InputDecoration(
                labelText: "Password",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () async {
                  bool registernavigate =
                      await register(_email.text, _password.text);
                  if (registernavigate) {}
                },
                child: customButton(context, "Register", 100)),
            Spacer(),
          ],
        ),
      ),
    ));
  }
}
