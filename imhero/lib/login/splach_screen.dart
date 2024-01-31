import 'package:flutter/material.dart';
import 'dart:async';
import 'package:imhero/common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return MaterialApp(
      home: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Center(
          child: SvgPicture.string(
            '../../asset/img/imhero.svg',
            width: 500,
            height: 500,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => SplashScreen(),
    },
  ));
}
