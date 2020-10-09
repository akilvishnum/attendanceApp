import 'package:attendance/constants.dart';
import 'package:attendance/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String email;
SharedPreferences pref;

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var sample;
  void newcall() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    newcall();
    setState(() {
      email = pref.getString('email');
    });
  }

  @override
  Future<bool> _onBackPressed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    await FirebaseFirestore.instance
        .collection('Staff')
        .doc(email)
        .get()
        .then((value) {
      sample = value.get('Email');
    });
    return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:
                                Text("Are you sure?", style: kHeadingextStyle),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Do you want to log out.",
                              style: kTitleTextStyle),
                        ],
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 8,
                      bottom: MediaQuery.of(context).size.height / 30,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () async {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.remove('email');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: kPrimaryColor,
                                ),
                                child: Text("YES",
                                    style: kTitleTextStyle.copyWith(
                                        color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: kPrimaryLightColor,
                                ),
                                child: Text("NO",
                                    style: kTitleTextStyle.copyWith(
                                        color: kPrimaryColor)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  final List _screens = [
    AllClass(email),
    AddUserClass("Class", null),
    Scaffold(),
    Scaffold(),
  ];
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 0.0,
          items: [
            Icons.home,
            Icons.add,
            Icons.account_circle,
          ]
              .asMap()
              .map((key, value) => MapEntry(
                    key,
                    BottomNavigationBarItem(
                      title: Text(''),
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: _currentIndex == key
                              ? Color(0xFF11249F).withOpacity(.85)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(value),
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
