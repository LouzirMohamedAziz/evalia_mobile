import 'dart:ffi';

import 'addres.dart';

class Entity {
  final int entityId;
  final String name;
  final String phone;
  final String mail;
  final Address address;
  final DateTime birthDate;
  final Bool verified;

  Entity(
      {required this.entityId,
      required this.name,
      required this.phone,
      required this.mail,
      required this.address,
      required this.birthDate,
      required this.verified});
}
