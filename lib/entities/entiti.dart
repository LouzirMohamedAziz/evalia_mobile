import 'addres.dart';

class Entity {
  final int entityId;
  final String name;
  final String phone;
  final String mail;
  final Address address;

  Entity({
    required this.entityId,
    required this.name,
    required this.phone,
    required this.mail,
    required this.address,
  });
}
