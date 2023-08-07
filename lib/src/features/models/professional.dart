import 'package:namer_app/src/features/models/Country.dart';
import 'package:namer_app/src/features/models/Entity.dart';
import 'package:namer_app/src/features/models/sector.dart';

class Professional extends Entity {
  final String tin;
  final DateTime birthDate;
  final Country country;
  final Sector sector;

  Professional(this.tin, this.birthDate, this.country, this.sector,
      {required super.entityId,
      required super.name,
      required super.phone,
      required super.mail,
      required super.address});
}
