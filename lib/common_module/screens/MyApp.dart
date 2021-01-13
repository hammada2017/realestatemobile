import 'package:flutter/material.dart';
import 'SplashScreenPage.dart';
import '../../style.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'عقارات ابوسعد',
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     textTheme: TextTheme(
      //       title: AppBarTextStyle,
      //     ),
      //   ),
      //   textTheme: TextTheme(
      //     title: TitleTextStyle,
      //     body1: Body1TextStyle,
      //   ),
      // ),
      home: SplashScreenPage(),
    );
  }
}