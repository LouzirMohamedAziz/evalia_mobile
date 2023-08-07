import 'dart:ffi';

import 'package:namer_app/src/features/models/country.dart';
import 'package:namer_app/src/features/models/entity.dart';

class Particular extends Entity {
  final Long userId;
  final String lastName;
  final DateTime birthDate;
  final Country nationality;

  Particular(this.userId, this.lastName, this.birthDate, this.nationality,
      {required super.entityId,
      required super.name,
      required super.phone,
      required super.mail,
      required super.address});
}
