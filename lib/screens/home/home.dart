import 'package:flutter/material.dart';
import 'package:fresh_mart/components/loading.dart';
import 'package:fresh_mart/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    print('In home');
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () async {
              dynamic result = await _authService.signOut();
            },
            child: Text("Sign Out"),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
