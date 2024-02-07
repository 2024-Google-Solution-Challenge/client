import 'package:flutter/material.dart';
import 'dart:async';
import 'package:imhero/common/colors.dart';
import 'package:imhero/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen())); //of(context).pushReplacementNamed('/home');
    });

    return MaterialApp(
      home: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Center(
          child: Image.asset('assets/img/imhero.png'),
        ),
      ),
    );
  }
}
