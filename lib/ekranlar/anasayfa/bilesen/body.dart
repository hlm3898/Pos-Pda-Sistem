import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Body extends StatefulWidget {
  @override
  _verial createState() => _verial();

}
class firmatas {
  final String adi;
  final int tutari;
  final charts.Color color;

  firmatas(this.adi, this.tutari, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
class _verial extends State<Body> {




  @override
  Widget build(BuildContext context) {
    var data = [
      firmatas('Ali', 12, Colors.red),
      firmatas('Hasan', 42, Colors.yellow),
      firmatas('Kral', 12, Colors.green),
    ];

    var seriler = [
      charts.Series(
        domainFn: (firmatas clickData, _) => clickData.adi,
        measureFn: (firmatas clickData, _) => clickData.tutari,
        colorFn: (firmatas clickData, _) => clickData.color,
        id: 'Firmalar',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      seriler,
      animate: true,
    );

    var firmasatislar = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 150.0,
        child: chart,
      ),
    );
    var tasilat = [
      firmatas('Halim', 12, Colors.red),
      firmatas('Barış', 42, Colors.yellow),
      firmatas('Levent', 12, Colors.green),
    ];

    var tasilatseri = [
      charts.Series(
        domainFn: (firmatas clickData, _) => clickData.adi,
        measureFn: (firmatas clickData, _) => clickData.tutari,
        colorFn: (firmatas clickData, _) => clickData.color,
        id: 'tahsilat',
        data: data,
      ),
    ];

    var tahgrafik = charts.PieChart(
      tasilatseri,
      animate: true,
    );

    var tahsilat = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 150.0,
        child: tahgrafik,
      ),
    );
    // This size provide us total height and width of our screen
    return Scaffold(
     body: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          'Firma Bazında Satış Grafiği',
        ),

        firmasatislar,
        Spacer(),
        new Text(
          'Firma Bazında Tahsilat Grafiği',
        ),
        tahsilat
      ],
    ),
    );
  }
}
