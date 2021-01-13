import 'package:flutter/material.dart';
import 'RealEstateForm.dart';


class RealEstateAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'إضافة عقار',
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white38,
          appBar: AppBar(
            backgroundColor: Colors.brown.shade700,
            title: Text(
              'إضافة عقار',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          ),
          body: RealEstateForm(),
        ),
      ),
    );
  }
}