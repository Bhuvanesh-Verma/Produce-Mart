import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_mart/components/already_have_account_check.dart';
import 'package:fresh_mart/components/rounded_button.dart';
import 'package:fresh_mart/components/rounded_input_field.dart';
import 'package:fresh_mart/components/rounded_password_field.dart';
import 'package:fresh_mart/components/text_field_container.dart';
import 'package:fresh_mart/screens/login/login.dart';
import 'package:fresh_mart/screens/signup/components/socila_icon.dart';
import 'package:fresh_mart/services/auth.dart';

import '../../../contraints.dart';
import 'background.dart';
import 'or_divider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? LoginScreen()
        : Background(
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
                  SizedBox(height: size.height * 0.01),
                  SvgPicture.asset(
                    "assets/images/signup.svg",
                    height: size.height * 0.3,
                  ),
                  Container(
                      //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        //SizedBox(height: 20.0),
                        TextFieldContainer(
                          child: TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Email",
                                border: InputBorder.none),
                            validator: (value) =>
                                value.isEmpty ? 'Enter an Email' : null,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFieldContainer(
                          child: TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Password",
                                border: InputBorder.none),
                            validator: (value) => value.length < 7
                                ? 'Length must be more than 6'
                                : null,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          width: size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });

                                  dynamic result = await _authService
                                      .registerWithEmailAndPassword(
                                          email, password);
                                  if (result.runtimeType ==
                                      FirebaseAuthException) {
                                    setState(() {
                                      loading = false;
                                      FirebaseAuthException e = result;
                                      error = e.message;
                                    });
                                  }
                                }
                              },
                              color: Colors.pink[400],
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        )
                      ],
                    ),
                  )),
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
