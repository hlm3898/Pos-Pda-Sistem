import 'package:flutter/material.dart';
import 'package:simsek/renkler.dart';
import 'package:simsek/ekranlar/hosgeldin/hosgeldin.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simşekler App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: hosgeldin(),
    );
  }
}
