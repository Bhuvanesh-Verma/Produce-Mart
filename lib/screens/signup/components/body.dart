import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_mart/components/already_have_account_check.dart';
import 'package:fresh_mart/components/rounded_button.dart';
import 'package:fresh_mart/components/rounded_input_field.dart';
import 'package:fresh_mart/components/rounded_password_field.dart';
import 'package:fresh_mart/screens/login/login.dart';
import 'package:fresh_mart/screens/signup/components/socila_icon.dart';

import 'background.dart';
import 'or_divider.dart';

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
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/images/signup.svg",
              height: size.height * 0.3,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Sign Up",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/images/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/images/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/images/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
