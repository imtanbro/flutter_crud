import 'package:flutter/material.dart';
import 'package:flutter_crud/Student/Attendance/attendance.dart';
import 'package:flutter_crud/Student/Profile/profile.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class Subject{
  String subname;
  String div;

  Subject({this.div = " ", this.subname = " "});
}

typedef OnDelete();

class HomePage extends StatefulWidget {
  final Subject subject;
  final OnDelete onDelete;

  HomePage({this.subject,this.onDelete});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Home Page"),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              initialValue: widget.subject.subname,
              validator: (val) => val.isEmpty ? "Enter Subject Name" : null,
              autocorrect: true,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only( top: 15, left: 5, right: 0, bottom: 15),
                child: SizedBox(
                  height: 4,
                  child: Icon(Icons.delete),
                ),
              ),
              hintText: 'Search artist, genre, playlist',
              hintStyle: TextStyle(fontSize: 11.0)),
        ),
          ],
        ),
      ),
    );
  }
}
