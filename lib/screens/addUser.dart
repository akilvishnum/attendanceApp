//import 'dart:js_util';

import 'dart:developer';
import 'dart:ffi';
//import 'dart:html';

import 'package:attendance/constraints.dart';
import 'package:attendance/model/classes.dart';
import 'package:attendance/screens/all_class.dart';
import 'package:attendance/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserClass extends StatefulWidget {
  final String _classOrStudent, _currentClassName;
  const AddUserClass(this._classOrStudent, this._currentClassName);
  @override
  _AddUserClassState createState() => _AddUserClassState();
}

class _AddUserClassState extends State<AddUserClass> {
  String email, classname;
  String studentRollNo;
  int x;
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    var _halfWidth = _width - (_width / 2) + (_width / 4);
    var _halfHeight = _height / 2;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  child: Container(
                    width: _halfWidth - (_halfWidth / 4),
                    height: _halfHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white.withOpacity(.5),
                    ),
                    alignment: Alignment(0, 0),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: _halfWidth,
                      height: _halfHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: [
                          SizedBox(height: _halfHeight / 4),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                                "Enter ${widget._classOrStudent == "Student" ? "Student Name" : "Class Name"}",
                                style: kTitleTextStyle.copyWith(
                                  fontSize: 25,
                                )),
                          ),
                          SizedBox(height: _halfHeight / 8),
                          Container(
                            width: _halfWidth - (_halfWidth / 8),
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFFD0D0D0),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                if (widget._classOrStudent == "Student")
                                  setState(() {
                                    studentRollNo = value;
                                  });
                                else
                                  setState(() {
                                    classname = value;
                                  });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: _halfHeight / 20),
                          InkWell(
                            onTap: () async {
                              if (widget._classOrStudent == "Student") {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                email = preferences.getString('email');
                                FirebaseFirestore.instance
                                    .runTransaction((transaction) async {
                                  try {
                                    DocumentReference ins =
                                        await FirebaseFirestore.instance
                                            .collection('Staff')
                                            .doc(email)
                                            .collection('Classrooms')
                                            .doc(widget._currentClassName);
                                    ins.snapshots().listen((event) {
                                      event.data().forEach((key, value) {
                                        if (key == "students") {
                                          x = value.length;
                                          print(x);
                                        }
                                      });
                                    });
                                    if (x == null) CircularProgressIndicator;
                                    print("The value of x is $x");
                                    ins.update({
                                      'students': FieldValue.arrayUnion(
                                          [studentRollNo]),
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ClassScreen(
                                                widget._currentClassName,
                                                x.toString(),
                                                email)));
                                    // await FirebaseFirestore.instance
                                    //     .collection('Staff')
                                    //     .doc(email)
                                    //     .collection('Classrooms')
                                    //     .doc(widget._currentClassName).
                                    //     .update({
                                    //   'students': FieldValue.arrayUnion(
                                    //       [studentRollNo]),
                                    //       'number':
                                    // });
                                    Fluttertoast.showToast(
                                      msg: "Successfully added $studentRollNo",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                    );
                                  } catch (e) {
                                    //print(e.message);
                                    Fluttertoast.showToast(
                                      msg: "Try again adding $studentRollNo",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                    );
                                  }
                                });
                              } else {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                email = preferences.getString('email');
                                FirebaseFirestore.instance.runTransaction(
                                    (Transaction transaction) async {
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('Staff')
                                        .doc(email)
                                        .collection('Classrooms')
                                        .doc(classname)
                                        .set({
                                      'students': [],
                                      'name': classname,
                                      'image': 'assets/images/ux_design.jpg',
                                    });
                                    Fluttertoast.showToast(
                                      msg:
                                          "Successfully created class $classname",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                    );
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                      msg:
                                          "Try again creating class $classname",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                    );
                                  }
                                });
                                classesData.add({
                                  'name': 'embedded systems',
                                  'students': 0,
                                  'image': "assets/images/ux_design.jpg"
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavScreen(email)));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 56,
                              width: _halfWidth - (_halfWidth / 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF3383CD),
                                    Color(0xFF11249F),
                                  ],
                                ),
                              ),
                              child: Text(
                                  "${widget._classOrStudent == "Student" ? "Add Student" : "Create Class"}",
                                  style: kTitleTextStyle.copyWith(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: _halfHeight - (50),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      'assets/images/person.png',
                      scale: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
