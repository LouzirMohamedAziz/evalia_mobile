class Country {
  final int id;
  final String isoCode;
  final String name;
  final Map<String, dynamic> links;

  Country(
      {required this.id,
      required this.isoCode,
      required this.name,
      required this.links});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      isoCode: json['isoCode'],
      name: json['name'],
      links: json['_links'],
    );
  }
}


// import 'package:namer_app/entities/governorate.dart';

// class Country {
//   final String id;
//   final String countryName;
//   final Governorate governorate;

//   Country(
//       {required this.id, required this.countryName, required this.governorate});

//   Country.fromJson(Map json)
//       : id = json['id'],
//         countryName = json['countryName'],
//         governorate = json['governorate'];

//   Map toJson() {
//     return {'id': id, 'countryName': countryName, 'governorate': governorate};
//   }
// }
