import 'dart:ffi';

import 'package:namer_app/src/features/models/Professional.dart';

class Rating {
  final Long ratingId;
  final String ratingComment;
  final Professional professional;

  Rating(this.ratingId, this.ratingComment, this.professional);
}
