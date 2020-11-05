import 'package:flutter/cupertino.dart';

class StudentData extends ChangeNotifier {
  String fname = "",
      mname = "",
      lname = "",
      div = "",
      semister = "",
      branch = "",
      aboutyou = "",
      rollno = "",
      studentId = "";
  int attendace = 0;
  

  StudentData(
      {this.aboutyou,
      this.attendace,
      this.branch,
      this.div,
      this.fname,
      this.lname,
      this.mname,
      this.rollno,
      this.semister,
      this.studentId});
}
