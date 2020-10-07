import 'package:attendance/constraints.dart';
import 'package:attendance/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/Login/components/background.dart';
import 'package:attendance/screens/Signup/signup_screen.dart';
import 'package:attendance/components/already_have_an_account_acheck.dart';
import 'package:attendance/components/rounded_button.dart';
import 'package:attendance/components/rounded_input_field.dart';
import 'package:attendance/components/rounded_password_field.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

String email, password;

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: kSubheadingextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              width: size.width,
              height: size.height * 0.4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/person2.png',
                      width: 200,
                      height: size.height * 0.27,
                    ),
                  ],
                ),
              ),
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  try {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('email', email);
                    UserCredential user = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    print(user.user.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavScreen()));
                  } catch (e) {
                    print("Invalid username or password");
                    Fluttertoast.showToast(
                      msg: "Invalid username or password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                    );
                  }
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
