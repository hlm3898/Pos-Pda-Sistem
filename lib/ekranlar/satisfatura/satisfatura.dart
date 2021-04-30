import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simsek/ozellikler/menu.dart';
import 'package:simsek/ekranlar/satisfatura/bilesen/body.dart';
class satisfatura extends StatefulWidget {
  @override
  satisstate createState() => satisstate();
}



class satisstate extends State<satisfatura> with SingleTickerProviderStateMixin{

  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SlidableScreen(),));
  }

  @override
  void initState() {
    super.initState();



    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: appbar(),
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

        ],
      ),
    );
  }
}