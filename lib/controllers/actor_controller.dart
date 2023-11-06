import 'package:get/get.dart';
import 'package:namer_app/repositories/actor_repository.dart';

import '../entities/actor.dart';

class ActorController extends GetxController {
  static ActorController get instance => Get.find();

  final _actorRepo = Get.put(ActorRepository());

  // final tin = TextEditingController();
  // final name = TextEditingController();
  // final birthDate = TextEditingController();
  // final actorType = TextEditingController();
  // final sector = TextEditingController();
  // final ratings = TextEditingController();

  // Future<Actor> getActorDetails() {
  //   final name = _actorRepo.
  // } createActor

  Future<void> createActor(Actor actor) async {
    await _actorRepo.createActor(actor);
  }

  Future<List<Actor>> getAllActors() async {
    return await _actorRepo.allActors();
  }
}
