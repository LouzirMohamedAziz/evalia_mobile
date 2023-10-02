import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../entities/user.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(User user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
              "Succes", "Your account has been created successfuly.",
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
  Future<User> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => User.fromSnapshot(e)).single;
    return userData;
  }

  // Fetch ALL Ratings from FireStore
  Future<List<User>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => User.fromSnapshot(e)).toList();
    return userData;
  }
}
