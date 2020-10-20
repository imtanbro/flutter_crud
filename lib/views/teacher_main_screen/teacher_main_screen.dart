import 'package:flutter_crud/views/teacher_main_screen/create_quiz.dart';
import 'package:flutter_crud/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TeacherMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: homeScreenBox(context, "Create Quiz", CreateQuiz()),
    );
  }
}
