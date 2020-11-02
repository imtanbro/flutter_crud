import 'package:flutter/material.dart';
import 'package:flutter_crud/Services/firestore_services.dart';
import 'package:flutter_crud/Student/HomeScreen/homescreen.dart';
import 'package:flutter_crud/Student/Signup/Studentdata.dart';
import 'package:flutter_crud/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class Register extends StatefulWidget {
  String email, password;
  Register(this.email, this.password);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  StudentData sd;
  DatabaseService db = new DatabaseService();

  // DatabaseService databaseService = new DatabaseService();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  // List<String> student = [
  //     fname,
  //      mname,
  //      lname,
  //      widget.email,
  //      rollno,
  //      widget.password,
  //      pickeddate.toString(),
  //      branch,
  //      semister,
  //      div,
  //      aboutyou,
  //      attendace.toString(),
  // ];

  addStudentData() async {
    sd.studentId = randomAlphaNumeric(10);
    Map<String, String> studentData = {
      "FirstName": sd.fname,
      "MiddleName": sd.mname,
      "LastName": sd.lname,
      "Email": widget.email,
      "RollNo": sd.rollno,
      "password": widget.password,
      "Dataofbirth": sd.pickeddate.toString(),
      "Branch": sd.branch,
      "Semister": sd.semister,
      "Division": sd.div,
      "About You": sd.aboutyou,
      "Attendance": sd.attendace.toString(),
    };
    db.addStudentsData(studentData, sd.studentId);
    db
        .addStudent(studentData, sd.studentId, sd.branch, sd.semister, sd.div)
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                    branch: sd.branch,
                    div: sd.div,
                    sId: sd.studentId,
                    sem: sd.semister))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sd.pickeddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Provider(
      create: (_) => StudentData(
          aboutyou: sd.aboutyou,
          attendace: sd.attendace,
          branch: sd.branch,
          div: sd.div,
          fname: sd.fname,
          lname: sd.lname,
          mname: sd.mname,
          pickeddate: sd.pickeddate,
          rollno: sd.rollno,
          semister: sd.semister,
          studentId: sd.studentId),
      child: Scaffold(
        appBar: NavbarCustom("Student Details"),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.black),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  validator: (val) {
                    return val.isEmpty ? "Enter First Name" : null;
                  },
                  style: TextStyle(
                    color: Color.fromRGBO(244, 180, 0, 1),
                    decorationColor: Color.fromRGBO(66, 133, 244, 1),

                    // backgroundColor: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    labelText: "First Name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onChanged: (val) {
                    sd.fname = val;
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  validator: (val) {
                    return val.isEmpty ? "Enter Middle Name" : null;
                  },
                  style: TextStyle(
                    color: Color.fromRGBO(244, 180, 0, 1),
                    decorationColor: Color.fromRGBO(66, 133, 244, 1),

                    // backgroundColor: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    hintText: "Your Middle/Fathers Name",
                    labelText: "Middle Name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onChanged: (val) {
                    sd.mname = val;
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  validator: (val) {
                    return val.isEmpty ? "Enter Last Name" : null;
                  },
                  style: TextStyle(
                    color: Color.fromRGBO(244, 180, 0, 1),
                    decorationColor: Color.fromRGBO(66, 133, 244, 1),

                    // backgroundColor: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    hintText: "Your Last Name",
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onChanged: (val) {
                    sd.lname = val;
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  validator: (val) {
                    return val.length <= 5
                        ? null
                        : "Roll number should be of 5 digits";
                  },
                  style: TextStyle(
                    color: Color.fromRGBO(244, 180, 0, 1),
                    decorationColor: Color.fromRGBO(66, 133, 244, 1),

                    // backgroundColor: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    hintText: "Your 5 digit Roll Number. (18101)",
                    labelText: "Roll No.",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    sd.rollno = val;
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ListTile(
                  title: Text(
                    "Date of Birth : ${sd.pickeddate.day}/${sd.pickeddate.month}/${sd.pickeddate.year}",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onTap: _pickDate,
                ),
                Row(
                  children: [
                    DropdownButton<String>(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      // dropdownColor: Colors.white,
                      items: [
                        DropdownMenuItem(
                            value: "Computer Engineering",
                            child: Text("Computer Engineering")),
                        DropdownMenuItem(value: "E&TC", child: Text("E&TC")),
                        DropdownMenuItem(
                            value: "Mechanical Engineering",
                            child: Text("Mechanical Engineering")),
                        DropdownMenuItem(
                            value: "Civil Engineering",
                            child: Text("Civil Engineering")),
                        DropdownMenuItem(
                            value: "Chemical Engineering",
                            child: Text("Chemical Engineering")),
                      ],
                      onChanged: (val) {
                        setState(() {});
                        sd.branch = val;
                        print(sd.branch);
                      },
                      hint: Text(
                        "Branch",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: sd.branch,
                      focusColor: Colors.white,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    DropdownButton<String>(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      items: [
                        DropdownMenuItem(value: "Sem 1", child: Text("Sem 1")),
                        DropdownMenuItem(value: "Sem 2", child: Text("Sem 2")),
                        DropdownMenuItem(value: "Sem 3", child: Text("Sem 3")),
                        DropdownMenuItem(value: "Sem 4", child: Text("Sem 4")),
                        DropdownMenuItem(value: "Sem 5", child: Text("Sem 5")),
                        DropdownMenuItem(value: "Sem 6", child: Text("Sem 6")),
                        DropdownMenuItem(value: "Sem 7", child: Text("Sem 7")),
                        DropdownMenuItem(value: "Sem 8", child: Text("Sem 8")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          sd.semister = val;
                          print(sd.semister);
                        });
                      },
                      hint: Text(
                        "Semester",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: sd.semister,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  validator: (val) {
                    return val == "A" || val == "B"
                        ? null
                        : "Division Should be A or B";
                  },
                  style: TextStyle(
                    color: Color.fromRGBO(244, 180, 0, 1),
                    decorationColor: Color.fromRGBO(66, 133, 244, 1),

                    // backgroundColor: Colors.blue,
                  ),
                  decoration: InputDecoration(
                    hintText: "Your Current Division",
                    labelText: "Div",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onChanged: (val) {
                    sd.div = val.toUpperCase();
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              addStudentData();
              print("Pressed");
            }
          },
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: sd.pickeddate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        sd.pickeddate = date;
        print(sd.pickeddate);
      });
    }
  }
}
