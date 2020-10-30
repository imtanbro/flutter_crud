import 'package:flutter/material.dart';
import 'package:flutter_crud/Student/HomeScreen/homescreen.dart';
import 'package:flutter_crud/Student/HomeScreen/subject.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<Subject> subject = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavbarCustom("Teachers Subjects"),
        body: subject.length <= 0
            ? Center(
                child: Text("Value is null"),
              )
            : ListView.builder(
                itemCount: subject.length,
                itemBuilder: (context, i) => HomePage(
                  subject: subject[i], onDelete: () => onDelete(i),
                ),
              ),
              floatingActionButton: Fl,);
  }

  void onDelete(int index) {
    setState(() {
      subject.removeAt(index);
    });
  }
}
