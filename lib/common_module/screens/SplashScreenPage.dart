import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'LoginPage.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new LoginPage(),
      backgroundColor: Colors.brown.shade900,
     // title: new Text('عقارات ابوسعد',textScaleFactor: 2,),
      image: new Image.asset(
          'assets/images/logo.png'
      ),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: Colors.white,
    );
  }
}
