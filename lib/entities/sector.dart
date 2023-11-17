import 'package:cloud_firestore/cloud_firestore.dart';

import 'sub_sector.dart';

class Sector {
  final String? id;
  final String sectorName;
  final SubSector subSector;

  Sector({required this.id, required this.sectorName, required this.subSector});

  toJson() {
    return {
      "id": id,
      "SectorName": sectorName,
      "SubSector": subSector,
    };
  }

  factory Sector.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return Sector(
      id: document.id,
      sectorName: data?["SectorName"] ?? "",
      subSector: data?["SubSector"] ?? SubSector(id: '', subSectorName: ""),
    );
  }
}
