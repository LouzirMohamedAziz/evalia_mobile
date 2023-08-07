import 'dart:ffi';

import 'package:namer_app/src/features/models/Performance.dart';

class Indicator {
  final Long indicatorId;
  final String indicatorName;
  final Performance performance;

  Indicator(this.indicatorId, this.indicatorName, this.performance);
}
