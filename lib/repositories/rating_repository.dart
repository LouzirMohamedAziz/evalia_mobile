import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../entities/rating.dart';

class RatingRepository extends GetxController {
  static RatingRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Store Ratings in FireStore
  createRating(Rating rating) async {
    await _db
        .collection("Ratings")
        .add(rating.toJson())
        .whenComplete(
          () => Get.snackbar(
              "Succes", "Your Rating has been added successfuly.",
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

  // Fetch Ratings details from FireStore
  Future<Rating> getRatingDetails(String sector) async {
    final snapshot = await _db
        .collection("Ratings")
        .where("Sector", isEqualTo: sector)
        .get();
    final ratingData = snapshot.docs.map((e) => Rating.fromSnapshot(e)).single;
    return ratingData;
  }

  // Fetch ALL Ratings from FireStore
  Future<List<Rating>> allRatings() async {
    final snapshot = await _db.collection("Ratings").get();
    final ratingData =
        snapshot.docs.map((e) => Rating.fromSnapshot(e)).toList();
    return ratingData;
  }
}
