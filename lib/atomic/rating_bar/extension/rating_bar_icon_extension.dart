import 'package:flutter/material.dart';

enum RatingBarIcon { star, heart }

extension RatingBarIconExtension on RatingBarIcon {
  Icon get icon => Icon(index == 0 ? Icons.star : Icons.favorite);
}
