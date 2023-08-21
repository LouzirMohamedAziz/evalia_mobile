import 'dart:ffi';

import 'package:namer_app/entities/addres.dart';
import 'package:namer_app/entities/entiti.dart';

class Moderator extends Entity {
  final String moderatorId;

  Moderator(this.moderatorId,
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
