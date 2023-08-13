import 'dart:ffi';

import 'professional.dart';

class Rating {
  final Long ratingId;
  final String ratingComment;
  final Professional professional;

  Rating(this.ratingId, this.ratingComment, this.professional);
}
