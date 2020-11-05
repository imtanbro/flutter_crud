import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/widgets.dart';

class Profile extends StatefulWidget {
  String div, semister, branch, studentId;
  Profile({this.branch, this.div, this.semister, this.studentId});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  QuerySnapshot profileSnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavbarCustom("Profile"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileSnapshot == null
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Branch")
                        .doc(widget.branch)
                        .collection(widget.semister)
                        .doc(widget.div)
                        .collection("Student Information")
                        .doc(widget.studentId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        Container(
                          child: Text("No Data"),
                        );
                      }

                      ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot course =
                              snapshot.data.documents[index];
                          return DisplayUserData(
                            name: course['FirstName'],
                          );
                        },
                      );
                    },
                  )
          ],
        ));
  }
}

class DisplayUserData extends StatelessWidget {
  String name;
  DisplayUserData({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}
