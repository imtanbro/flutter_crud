import 'package:flutter/material.dart';
import 'package:flutter_crud/Student/Attendance/attendance.dart';
import 'package:flutter_crud/Student/Profile/profile.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  
    List<Widget> _children = [
      HomePage(),
      Attendance(),
      Profile(),
    ];
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarCustom("Home Page"),
      bottomNavigationBar: Bottomnavbar(_currentIndex),
      body: _children[_currentIndex],
    );
  }
}
