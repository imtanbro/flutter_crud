import 'package:flutter_crud/helper/constant.dart';
import 'package:flutter_crud/views/home_page/home.dart';
import 'package:flutter_crud/views/notifications/notifications.dart';
import 'package:flutter_crud/views/profile/profilescreen.dart';
import 'package:flutter_crud/views/study_material/studymaterial.dart';
import 'package:flutter_crud/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> _children = [
    Home(),
    Notifications(),
    StudyMaterial(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notifications",
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: "StudyMaterial",
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                  backgroundColor: kPrimaryColor)
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }));
  }
}
