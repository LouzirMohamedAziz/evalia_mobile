import 'dart:ffi';

import 'package:namer_app/models/country.dart';
import 'package:namer_app/models/delegation.dart';
import 'package:namer_app/models/governorate.dart';

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
