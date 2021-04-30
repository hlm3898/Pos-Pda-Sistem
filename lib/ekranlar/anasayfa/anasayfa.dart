import 'package:flutter/material.dart';
import 'package:simsek/ekranlar/anasayfa/bilesen/body.dart';
import 'package:simsek/ozellikler/menu.dart';
class Anasayfa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: appbar(),
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Body(),



    );

  }
}