import 'package:attendance/constraints.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/Login/login_screen.dart';
import 'package:attendance/screens/Signup/components/background.dart';
import 'package:attendance/components/rounded_button.dart';
import 'package:attendance/components/rounded_input_field.dart';
import 'package:attendance/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String email, password, name, staffid;

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
                  children: [
                    Image.asset(
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
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Staff Id",
              onChanged: (value) {
                staffid = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                try {
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                  await FirebaseFirestore.instance
                      .collection('Staff')
                      .doc(email)
                      .set({
                    'Name': name,
                    'StaffId': staffid,
                    'Email': email,
                    'Password': password,
                  });
                  Fluttertoast.showToast(
                    msg: "Successfully registered",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                  );
                } catch (e) {
                  print(e.message);
                  Fluttertoast.showToast(
                    msg: "Username already available",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
