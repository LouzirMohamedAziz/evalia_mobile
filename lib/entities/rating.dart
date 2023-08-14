import 'dart:ffi';

import 'professiona.dart';

class Rating {
  final Long ratingId;
  final String ratingComment;
  final Professional professional;

  Rating(this.ratingId, this.ratingComment, this.professional);
}
