import 'dart:ffi';

import 'performance.dart';

class Indicator {
  final Long indicatorId;
  final String indicatorName;
  final Performance performance;

  Indicator(this.indicatorId, this.indicatorName, this.performance);
}
