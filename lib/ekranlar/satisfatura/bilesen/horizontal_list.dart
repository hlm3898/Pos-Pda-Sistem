import 'package:flutter/material.dart';
import 'package:simsek/ekranlar/satisfatura/bilesen/tasarim.dart';

class HorizontalList extends StatelessWidget {
  HorizontalList(this.item);
  final faturaliste item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      width: 90.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: CircleAvatar(
              backgroundColor: item.color,
              child: Text('${item.fatno}'),
              foregroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                item.tutar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
