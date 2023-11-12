import 'package:get/get.dart';
import 'package:namer_app/entities/sector.dart';
import 'package:namer_app/entities/sub_sector.dart';
import 'package:namer_app/repositories/actor_repository.dart';

import '../entities/actor.dart';

class ActorController extends GetxController {
  static ActorController get instance => Get.find();

  final _actorRepo = Get.put(ActorRepository());

  Future<void> createActor(Actor actor) async {
    await _actorRepo.createActor(actor);
  }

  Future<List<Actor>> getAllActors() async {
    final List<Actor> actors = await _actorRepo.allActors();
    return actors;
  }

  // This Function will get Actor from the database, if it doesn't exist, it will create it.
  Future<Actor?> createOrGetActor(String actorName) async {
    // First, We will check if the Actor exists in the database or not:
    Actor emptyActor = Actor(
      id: '',
      tin: '',
      name: '',
      address: '',
      birthDate: DateTime.now(),
      actorType: '',
      sector: Sector('', '', SubSector('', '')),
      ratings: [],
    );

    final existingActors = await _actorRepo.allActors();
    final existingActor = existingActors.firstWhere(
        (actor) => actor.name.toLowerCase() == actorName.toLowerCase(),
        orElse: () => emptyActor);

    if (existingActor != emptyActor) {
      return existingActor;
    } else {
      // in this case the actor doesn't exists, we will create a new one
      final newActor = Actor(
        id: '',
        tin: '',
        name: actorName,
        address: '',
        birthDate: DateTime.now(),
        actorType: '',
        sector: Sector('', '', SubSector('', '')),
        ratings: [],
      );

      // before creating the newActor here, we have to delete the emptyActor
      await _actorRepo.createActor(newActor);
      return newActor;
    }
  }
}
