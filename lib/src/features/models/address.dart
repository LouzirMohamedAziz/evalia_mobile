import 'dart:ffi';

import 'package:namer_app/src/features/models/Country.dart';
import 'package:namer_app/src/features/models/Governorate.dart';
import 'package:namer_app/src/features/models/delegation.dart';

class Address {
  final Long adressId;
  final Country countryName;
  final Governorate governorate;
  final Delegation delegation;
  final String street;
  final int houseNumber;
  final int postalCode;

  Address({
    required this.adressId,
    required this.countryName,
    required this.governorate,
    required this.delegation,
    required this.street,
    required this.houseNumber,
    required this.postalCode,
  });
}
