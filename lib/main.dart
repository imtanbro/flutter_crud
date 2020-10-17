import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(),
      drawer: Drawer(child: ListView(
        children: [
          Container(
            color: Colors.black,
            alignment: Alignment.center,
          )
        ],
      ),),   
      floatingActionButton: FloatingActionButton(),   

    );
  }
}
