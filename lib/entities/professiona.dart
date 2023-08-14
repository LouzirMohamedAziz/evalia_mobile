import 'dart:ffi';

import 'country.dart';
import 'entiti.dart';
import 'sector.dart';

class Professional extends Entity {
  final Long professionalId;
  final String tin;
  final String actorname;
  final String actorType;
  final DateTime birthDate;
  final Country country;
  final Sector sector;

  Professional(this.professionalId, this.tin, this.actorname, this.actorType,
      this.birthDate, this.country, this.sector,
      {required super.entityId,
      required super.name,
      required super.phone,
      required super.mail,
      required super.address});
}
