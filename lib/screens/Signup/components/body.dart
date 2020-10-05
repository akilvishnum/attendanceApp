import 'package:attendance/constraints.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/Login/login_screen.dart';
import 'package:attendance/screens/Signup/components/background.dart';
import 'package:attendance/components/rounded_button.dart';
import 'package:attendance/components/rounded_input_field.dart';
import 'package:attendance/components/rounded_password_field.dart';
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
              "SIGNUP",
              style: kSubheadingextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              width: size.width,
              height: size.height * 0.35,
              child: Container(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ Image.asset(
                      'assets/images/thumbsup.png',
                      height: size.height * 0.35,
                      width: 0.5 * size.width,
                    ),
                  ],
                ),
              ),
            ),            
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
