import 'package:flutter/material.dart';

class ReviewModel extends ChangeNotifier {
  String name;
  String id;
  num stars;
  String description;

  ReviewModel(
      {required this.id,
      required this.name,
      required this.stars,
      required this.description});
}
