import 'package:namer_app/entities/addres.dart';

import 'country.dart';
import 'entiti.dart';
import 'sector.dart';

class Professional extends Entity {
  final String professionalId;
  final String tin;
  final String actorname;
  final String actorType;
  final DateTime birthDate;
  final Country country;
  final Sector sector;

  Professional(this.professionalId, this.tin, this.actorname, this.actorType,
      this.birthDate, this.country, this.sector,
      {required int entityId,
      required String name,
      required String phone,
      required String mail,
      required Address address})
      : super(
            entityId: entityId,
            name: name,
            phone: phone,
            mail: mail,
            address: address);
}
