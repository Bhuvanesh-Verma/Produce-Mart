import 'package:flutter/material.dart';
import 'package:fresh_mart/components/loading.dart';
import 'package:fresh_mart/models/user.dart';
import 'package:fresh_mart/screens/welcome/welcome.dart';
import 'package:fresh_mart/services/auth.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

class _WrapperState extends State<Wrapper> {
  AuthStatus authStatus = AuthStatus.notDetermined;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final AuthService authService = AuthService();

    authService.currentUser().then((value) => authStatus =
        value == null ? AuthStatus.notSignedIn : AuthStatus.signedIn);
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return Loading();
      case AuthStatus.notSignedIn:
        return WelcomeScreen();
      case AuthStatus.signedIn:
        return Home();
    }
    return null;
  }
}
