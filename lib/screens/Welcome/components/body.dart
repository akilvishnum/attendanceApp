import 'package:attendance/constraints.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/Login/login_screen.dart';
import 'package:attendance/screens/Signup/signup_screen.dart';
import 'package:attendance/screens/Welcome/components/background.dart';
import 'package:attendance/components/rounded_button.dart';
import 'package:attendance/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME. NICE TO HAVE YOU.",
              style: kSubheadingextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              child: Container(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ Image.asset(
                      'assets/images/heart.png',
                      height: size.height * 0.35,
                      width: 0.5 * size.width,
                    ),
                  ],
                ),
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
