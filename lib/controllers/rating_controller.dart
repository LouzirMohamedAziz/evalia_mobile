import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../entities/entiti.dart';
import '../entities/indicator.dart';
import '../entities/performanc.dart';
import '../entities/professiona.dart';
import '../repositories/rating_repository.dart';

class RatingController extends GetxController {
  static RatingController get instance => Get.find();

  final ratingComment = TextEditingController();
  final score = TextEditingController();
  final rater = TextEditingController();
  final professional = TextEditingController();
  final performance = TextEditingController();
  final indicator = TextEditingController();
  final sector = TextEditingController();

  void registerRating(String ratingComment, String score, Entity entity,
      Professional professional, Performance performance, Indicator indicator) {
    RatingRepository.instance.createRating;
  }
}
