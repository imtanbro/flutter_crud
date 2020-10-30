import 'package:flutter/material.dart';
import 'package:flutter_crud/Student/Attendance/attendance.dart';
import 'package:flutter_crud/Student/HomeScreen/subject.dart';
import 'package:flutter_crud/Student/Profile/profile.dart';
import 'package:flutter_crud/widgets/widgets.dart';



typedef OnDelete();

class HomePage extends StatefulWidget {
  final Subject subject;
  final OnDelete onDelete;

  HomePage({this.subject, this.onDelete});

  @override
  _HomePageState createState() => _HomePageState();

  bool isValid() =>  _HomePageState().validate();
}

class _HomePageState extends State<HomePage> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Home Page"),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          child: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.subject),
                  title: Text("Add Subject"),
                  centerTitle: true,
                  actions: [
                    IconButton(icon: Icon(Icons.delete), onPressed: widget.onDelete)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: widget.subject.subname,
                    validator: (val) =>
                        val.isEmpty ? null : "Enter Subject Name you Teach",
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: 'Subject Name',
                        labelStyle: TextStyle(fontSize: 20.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: widget.subject.subname,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Division Field Cannot be Empty";
                      } else if (val != "A" ||
                          val != "B" ||
                          val != "a" ||
                          val != "b") {
                        return "Please enter either A or B";
                      } else
                        return null;
                    },
                    autocorrect: true,
                    autovalidate: true,
                    decoration: InputDecoration(
                        labelText: 'Div',
                        labelStyle: TextStyle(fontSize: 20.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}

