import 'package:attendance/constraints.dart';
import 'package:attendance/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  String useremail;
  UserDetails(this.useremail);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  void getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.useremail = preferences.getString("email");
    });
  }

  @override
  void initstate() {
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h / 20),
            Padding(
              padding: EdgeInsets.only(left: w / 20),
              child: Container(
                child: Text(
                  "Profile",
                  style: kHeadingextStyle.copyWith(fontFamily: 'Heading', fontSize: 35,),
                ),
              ),
            ),
            SizedBox(height: h / 30),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.7),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(w / 20),
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: (4 * w) / 20,
                                    height: h * 3 / 30,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFF3383CD),
                                          Color(0xFF11249F),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: new AssetImage(
                                          'assets/images/poojaFullSize.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: (10 * w) / 20,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("XYZ",
                                              style:
                                                  kSubheadingextStyle.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 26)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxHeight: h),
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: ListView(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: w / 20),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      CustomIcon.at_sign,
                                                      color: Color(0xFF3383CD),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text(
                                                      "${widget.useremail}",
                                                      style: kTitleTextStyle
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: w / 20),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .sentiment_very_satisfied,
                                                      color: Color(0xFF3383CD),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text(
                                                      "Teaching 162 Happy Students",
                                                      style: kTitleTextStyle
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: w / 20),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .perm_contact_calendar,
                                                      color: Color(0xFF3383CD),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text(
                                                      "1318",
                                                      style: kTitleTextStyle
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: w / 20),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      CustomIcon.home,
                                                      color: Color(0xFF3383CD),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text(
                                                      "Handling 18 Classes",
                                                      style: kTitleTextStyle
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: w / 20),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      CustomIcon.user,
                                                      color: Color(0xFF3383CD),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text(
                                                      "XYZ",
                                                      style: kTitleTextStyle
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
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
  }
}
