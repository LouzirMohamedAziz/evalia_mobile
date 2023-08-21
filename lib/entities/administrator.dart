import 'dart:ffi';

import 'package:namer_app/entities/addres.dart';

import 'entiti.dart';

class Administrator extends Entity {
  final String administratorId;

  Administrator(this.administratorId,
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
