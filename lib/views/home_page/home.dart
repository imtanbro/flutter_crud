import 'package:flutter_crud/views/assignments/assignments.dart';
import 'package:flutter_crud/views/quiz/Quiz.dart';
import 'package:flutter_crud/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          homeScreenBox(context, "Quiz", Quiz()),
          homeScreenBox(context, "Assignments", Assignments())
        ],
      ),
    );
  }
}
