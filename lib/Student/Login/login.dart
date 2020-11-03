// import 'package:flutter/material.dart';
// import 'package:flutter_crud/Services/firestore_services.dart';
// import 'package:flutter_crud/Student/HomeScreen/homescreen.dart';
// import 'package:flutter_crud/Student/Signup/signup.dart';
// import 'package:flutter_crud/widgets/widgets.dart';

// class Authentication extends StatefulWidget {
//   @override
//   _AuthenticationState createState() => _AuthenticationState();
// }

// class _AuthenticationState extends State<Authentication> {
//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(color: Colors.black),
//         child: Column(
//           children: [
//             Spacer(),
//             TextFormField(
//               controller: _email,
//               cursorColor: Colors.blue,
//               style: TextStyle(
//                 color: Color.fromRGBO(244, 180, 0, 1),
//                 decorationColor: Color.fromRGBO(66, 133, 244, 1),

//                 // backgroundColor: Colors.blue,
//               ),
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 hintText: "Something@email.com",
//                 labelText: "Email",
//                 labelStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//                 hintStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.pink, width: 2.0),
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _password,
//               obscureText: true,
//               cursorColor: Colors.blue,
//               style: TextStyle(
//                 color: Color.fromRGBO(244, 180, 0, 1),
//                 decorationColor: Color.fromRGBO(66, 133, 244, 1),

//                 // backgroundColor: Colors.blue,
//               ),
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.pink, width: 2.0),
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//                 labelStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             GestureDetector(
//                 onTap: () async {
//                   bool signinnavigator =
//                       await signIn(_email.text, _password.text);
//                   if (!signinnavigator) {
//                     print("Error");
//                   }
//                   else{
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//                   }
//                 },
//                 child: customButton(context, "Sign In", 100)),
//             SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//                 onTap: () async {
//                   bool registernavigate =
//                       await register(_email.text, _password.text);
//                   if (registernavigate) {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Register(_email.text,_password.text)));
//                   }
//                 },
//                 child: customButton(context, "Register", 100)),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_crud/Teacher/Register/auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthService>().signInteacher(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: Text("Sign in"),
          )
        ],
      ),
    );
  }
}