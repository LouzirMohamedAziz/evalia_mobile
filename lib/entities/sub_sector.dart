import 'package:cloud_firestore/cloud_firestore.dart';

class SubSector {
  final String? id;
  final String subSectorName;

  SubSector({required this.id, required this.subSectorName});

  toJson() {
    return {
      "id": id,
      "SubSectorName": subSectorName,
    };
  }

  factory SubSector.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return SubSector(
      id: document.id,
      subSectorName: data?["SubSectorName"] ?? "",
    );
  }
}
