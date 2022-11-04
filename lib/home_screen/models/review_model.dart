import 'package:flutter/material.dart';

class ReviewModel extends ChangeNotifier {
  late final String id;
  late final String name;
  late final num stars;
  late final String description;
  
  ReviewModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    stars = json['stars'];
    description = json['description'];
  }
  ReviewModel(
      {required this.id,
      required this.name,
      required this.stars,
      required this.description});
}
