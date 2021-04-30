import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simsek/ekranlar/satisfatura/bilesen/tasarim.dart';

class VerticalList extends StatelessWidget {
  VerticalList(this.item);
  final faturaliste item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
      Slidable.of(context)?.renderingMode == SlidableRenderingMode.none
          ? Slidable.of(context)?.open()
          : Slidable.of(context)?.close(),
      child: Container(
        color: Colors.white10,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: item.color,
            child: Text('${item.fatno}'),
            foregroundColor: Colors.white,
          ),
          title: Text(item.fatfir),
          subtitle: Text(item.tutar),
        ),
      ),
    );
  }
}
