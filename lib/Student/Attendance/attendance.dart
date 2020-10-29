import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';
class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Attendance"),
      
    );
  }
}