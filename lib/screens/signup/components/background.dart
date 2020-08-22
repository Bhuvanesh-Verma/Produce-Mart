import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset("assets/designs/login_top.png"),
            // width: size.width * 0.35,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/design/main_bottom.png"),
            width: size.width * 0.2,
          ),
          child
        ],
      ),
    );
  }
}
