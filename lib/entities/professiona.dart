import 'dart:ffi';

import 'package:namer_app/entities/addres.dart';
import 'package:namer_app/entities/rating.dart';

import 'entiti.dart';
import 'sector.dart';

class Professional extends Entity {
  final String professionalId;
  final String tin;
  final String actorType;
  final Sector sector;

  final List<Rating> ratings;

  Professional(
      this.professionalId, this.tin, this.actorType, this.sector, this.ratings,
      {required int entityId,
      required String name,
      required String phone,
      required String mail,
      required Address address,
      required DateTime birthDate,
      required Bool verified})
      : super(
            entityId: entityId,
            name: name,
            phone: phone,
            mail: mail,
            address: address,
            birthDate: birthDate,
            verified: verified);
}
