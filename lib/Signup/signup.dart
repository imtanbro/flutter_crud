import 'package:flutter/material.dart';
import 'package:flutter_crud/Services/firestore_services.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String fname, mname, lname, userId, div, semister, branch, aboutyou, rollno;
  DateTime pickeddate;

  // DatabaseService databaseService = new DatabaseService();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickeddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.black),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            
            // TextFormField(
            //   controller: _email,
            //   cursorColor: Colors.blue,
            //   validator: (value) {
            //     if (value.isEmpty) {
            //       return "Username cannot be empty";
            //     } else
            //       return null;
            //   },
            //   style: TextStyle(
            //     color: Color.fromRGBO(244, 180, 0, 1),
            //     decorationColor: Color.fromRGBO(66, 133, 244, 1),

            //     // backgroundColor: Colors.blue,
            //   ),
            //   decoration: InputDecoration(
            //     hintText: "Something@email.com",
            //     labelText: "Email",
            //     labelStyle: TextStyle(
            //       color: Colors.white,
            //     ),
            //     hintStyle: TextStyle(
            //       color: Colors.white,
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(color: Colors.pink, width: 2.0),
            //       borderRadius: BorderRadius.circular(25.0),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.01,
            // ),
            // TextFormField(
            //   controller: _password,
            //   obscureText: true,
            //   cursorColor: Colors.blue,
            //   style: TextStyle(
            //     color: Color.fromRGBO(244, 180, 0, 1),
            //     decorationColor: Color.fromRGBO(66, 133, 244, 1),

            //     // backgroundColor: Colors.blue,
            //   ),
            //   decoration: InputDecoration(
            //     labelText: "Password",
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(color: Colors.pink, width: 2.0),
            //       borderRadius: BorderRadius.circular(25.0),
            //     ),
            //     labelStyle: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.01,
            // ),
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
                hintText: "Your First Name",
                labelText: "First Name",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onChanged: (val) {
                fname = val;
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
                hintText: "Your Middle Name",
                labelText: "Middle Name",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onChanged: (val) {
                mname = val;
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
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onChanged: (val) {
                lname = val;
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            TextFormField(
              validator: (val) {
                return val.length <= 2
                    ? null
                    : "Roll number should be of 2 digits";
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
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                rollno = val;
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              title: Text(
                "Date of Birth : ${pickeddate.day}/${pickeddate.month}/${pickeddate.year}",
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
                    branch = val;
                    print(branch);
                  },
                  hint: Text("Branch", style: TextStyle(color: Colors.white),),
                  value: branch,
                ),
                SizedBox(
                  width: 40,
                ),
                DropdownButton<String>(
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
                      semister = val;
                      print(semister);
                    });
                  },
                  hint: Text("Semester",style: TextStyle(color: Colors.white),),
                  value: semister,
                ),
                TextFormField(
              validator: (val) {
                return val.length <= 2
                    ? null
                    : "Roll number should be of 2 digits";
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
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                div = val;
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignIn()));
                      print("Clicked on Sign IN Already have account");
                    },
                    child: Text(
                      "Already have an Account?",
                      style: TextStyle(fontSize: 15),
                    )),
                GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignIn()));
                      print("Clicked on Sign IN");
                    },
                    child: Text(
                      " Sign In",
                      style: TextStyle(
                          fontSize: 15, decoration: TextDecoration.underline),
                    ))
              ],
            ),
            
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () async {
                  bool registernavigate =
                      await register(_email.text, _password.text);
                  if (registernavigate) {}
                },
                child: customButton(context, "Register", 100)),
          ],
        ),
      ),
    ));
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickeddate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        pickeddate = date;
        print(pickeddate);
      });
    }
  }
}
