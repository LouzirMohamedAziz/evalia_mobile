import 'country.dart';
import 'entity.dart';
import 'sector.dart';

class Professional extends Entity {
  final String tin;
  final DateTime birthDate;
  final Country country;
  final Sector sector;

  Professional(this.tin, this.birthDate, this.country, this.sector,
      {required super.entityId,
      required super.name,
      required super.phone,
      required super.mail,
      required super.address});
}
