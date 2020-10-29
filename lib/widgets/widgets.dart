import 'package:flutter/material.dart';

class NavbarCustom extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String titlenav;

  NavbarCustom(
    this.titlenav, {
    Key key,
  })  : preferredSize = Size.fromHeight(60),
        super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      title: Text(
        titlenav,
        style: TextStyle(
          color: Colors.yellowAccent,
          fontSize: 25,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class Bottomnabbar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  int index;

  Bottomnabbar(
    this.index, {
    Key key,
  })  : preferredSize = Size.fromHeight(60),
        super(key: key);

  @override
  _BottomnabbarState createState() => _BottomnabbarState();
}

class _BottomnabbarState extends State<Bottomnabbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Attendance"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: (val) {
        setState(() {
          widget.index = val;
        });
      },
    );
  }
}

// Widget bottomnavbar(
//     {BuildContext context, int index, int size, Function state}) {
//   return BottomNavigationBar(
//     currentIndex: index,
//     items: [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//       BottomNavigationBarItem(icon: Icon(Icons.add), label: "Attendance"),
//       BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//     ],
//     onTap: (val) {},
//   );
// }

Widget customButton(BuildContext context, String title, int size) {
  return Container(
    width: MediaQuery.of(context).size.width - size,
    height: 50,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(66, 133, 244, 1),
            Color.fromRGBO(219, 68, 55, 1),
            Color.fromRGBO(244, 180, 0, 1),
          ]),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
