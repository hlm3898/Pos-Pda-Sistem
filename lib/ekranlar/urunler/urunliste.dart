import 'package:flutter/material.dart';
import 'package:simsek/ozellikler/menu.dart';
class Urunler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: appbar(),
        appBar: AppBar(
          title: Text("Anasayfa"),
        ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Ürün 1')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Ürün 2')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Ürün 3')),
          ),
        ],
      )
    );
  }
}
