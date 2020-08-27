import 'package:flutter/material.dart';
import 'package:fresh_mart/models/user.dart';
import 'package:fresh_mart/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // returns home or authrnticate
    return user == null ? WelcomeScreen() : Home();
  }
}
