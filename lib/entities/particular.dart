import 'package:namer_app/entities/addres.dart';

import 'country.dart';
import 'entiti.dart';

class Particular extends Entity {
  final String userId;
  final String lastName;
  final DateTime birthDate;
  final Country nationality;

  Particular(this.userId, this.lastName, this.birthDate, this.nationality,
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
