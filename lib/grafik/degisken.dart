import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class Satislistesi {
  final String adi;
  final int tutari;
  final charts.Color rengi;

  Satislistesi(
      {@required this.adi,
        @required this.tutari,
        @required this.rengi});
}