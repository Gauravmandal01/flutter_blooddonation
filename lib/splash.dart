import 'dart:async';
import 'package:flutter/material.dart';
 
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamed(context, "splashScreen");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 250, 251),
        ),
        child: Center(
          child: Image.asset(
            "assets/bloodLogo1.png",
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
