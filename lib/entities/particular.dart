import 'dart:ffi';

import 'country.dart';
import 'entiti.dart';

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
