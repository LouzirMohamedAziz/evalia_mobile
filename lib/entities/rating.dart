import 'package:cloud_firestore/cloud_firestore.dart';

import 'entiti.dart';
import 'indicator.dart';
import 'performanc.dart';
import 'professiona.dart';
import 'sector.dart';

class Rating {
  final String? ratingId;
  final String ratingComment;
  final String score;
  final Entity rater;
  final Professional professional;
  final Performance performance;
  final Indicator indicator;
  final Sector sector;

  Rating(
      {required this.ratingId,
      required this.ratingComment,
      required this.score,
      required this.rater,
      required this.professional,
      required this.performance,
      required this.indicator,
      required this.sector});

  toJson() {
    return {
      "RatingComment": ratingComment,
      "Score": score,
      "Rater": rater,
      "Professional": professional,
      "Performance": performance,
      "Indicator": indicator,
      "Sector": sector,
    };
  }

  factory Rating.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return Rating(
        ratingId: document.id,
        ratingComment: data?["RatingComment"],
        score: data?["Score"],
        rater: data?["Rater"],
        professional: data?["Professional"],
        performance: data?["Performance"],
        indicator: data?["Indicator"],
        sector: data?["Sector"]);
  }
}
