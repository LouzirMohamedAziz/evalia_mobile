import 'entiti.dart';
import 'indicator.dart';
import 'professiona.dart';

class Rating {
  final String ratingId;
  final String ratingComment;
  final String score;
  final Entity rater;
  final Professional professional;
  final Indicator indicator;

  Rating(this.ratingId, this.ratingComment, this.score, this.rater,
      this.professional, this.indicator);
}
