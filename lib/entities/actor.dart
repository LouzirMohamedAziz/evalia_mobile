import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/entities/rating.dart';

import 'sector.dart';

class Actor {
  final String? id;
  final String tin;
  final String name;
  final String address;
  final DateTime birthDate;
  final String actorType;
  final Sector sector;
  final List<Rating> ratings;

  Actor(
      {required this.id,
      required this.tin,
      required this.name,
      required this.address,
      required this.birthDate,
      required this.actorType,
      required this.sector,
      required this.ratings});

  toJson() {
    return {
      "Tin": tin,
      "Name": name,
      "Address": address,
      "BirthDate": birthDate,
      "ActorType": actorType,
      "Sector": sector,
      "Ratings": ratings,
    };
  }

  factory Actor.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return Actor(
      id: document.id,
      tin: data?["Tin"],
      name: data?["Name"],
      address: data?["Address"],
      birthDate: data?["BirthDate"],
      actorType: data?["actorType"],
      sector: data?["Sector"],
      ratings: data?["Ratings"],
    );
  }
}
