import 'package:flutter/material.dart';
import 'MyHomePage.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality( // add this
      textDirection: TextDirection.rtl, // set this property
      child:DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: [
              MyHomePage(title: 'عقارات ابوسعد',),
              MyHomePage(title: 'عقارات ابوسعد',),
              MyHomePage(title: 'عقارات ابوسعد',),
              MyHomePage(title: 'عقارات ابوسعد',),
              MyHomePage(title: 'عقارات ابوسعد',),
            ],
          ),
        ),
      ),
    );
  }
}