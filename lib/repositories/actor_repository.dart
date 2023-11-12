import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/entities/actor.dart';

import '../entities/rating.dart';
import '../entities/sector.dart';

class ActorRepository extends GetxController {
  static ActorRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

// Create an Actor and add it to the database
  createActor(Actor actor) async {
    await _db
        .collection("Actor")
        .add(actor.toJson())
        .whenComplete(
          () => Get.snackbar("Succes", "An Actor has been created successfuly.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Color.fromARGB(0, 192, 242, 186),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Please, Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 246, 173, 168),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // delete Actor
  void deleteUser(String id) {}

  // Fetch all Actors
  Future<List<Actor>> allActors() async {
    final snapshot = await _db.collection("Actor").get();
    final actorData = snapshot.docs.map((e) => Actor.fromSnapshot(e)).toList();
    return actorData;
  }

  // Fetch ONE Actor
  Future<Actor> getActorDetails(
      String tin,
      String name,
      String address,
      DateTime birthDate,
      String actorType,
      Sector sector,
      List<Rating> ratings) async {
    final snapshot =
        await _db.collection("Actor").where("Name", isEqualTo: name).get();
    final actorData = snapshot.docs.map((e) => Actor.fromSnapshot(e)).single;
    return actorData;
  }
}
