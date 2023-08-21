import 'package:namer_app/entities/governorate.dart';

class Country {
  final String countryID;
  final String countryName;
  final Governorate governorate;

  Country(
      {required this.countryID,
      required this.countryName,
      required this.governorate});
}
