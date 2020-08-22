import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              bottom: 0,
              child: Image.asset(
                'assets/designs/bottom.png',
                //width: size.width * 0.2,
              )),
          Positioned(
              top: 0,
              child: Image.asset(
                'assets/designs/top.png',
                //width: size.width * 0.2,
              )),
          child
        ],
      ),
    );
  }
}
