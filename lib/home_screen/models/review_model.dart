import 'package:flutter/material.dart';

class reviewModel extends ChangeNotifier {
  String name;
  String id;
  num stars;
  String description;

  reviewModel(
      {required this.id,
      required this.name,
      required this.stars,
      required this.description});
}
