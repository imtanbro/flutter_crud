import 'package:flutter/material.dart';
import 'package:flutter_crud/Student/Login/login.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 300, 10, 100),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Authentication()));
            },
            child: customButton(context, "Teacher", 30)),
          SizedBox(height: 40,),
          customButton(context, "Student", 30),
        ],),
      ),
    );
  }
}