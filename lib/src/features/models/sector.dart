import 'dart:ffi';

import 'package:namer_app/src/features/models/sub_sector.dart';

class Sector {
  final Long sectorId;
  final String sectorName;
  final SubSector subSector;

  Sector(this.sectorId, this.sectorName, this.subSector);
}
