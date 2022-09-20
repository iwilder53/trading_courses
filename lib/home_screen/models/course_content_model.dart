import 'package:flutter/material.dart';

class CourseContentModel with ChangeNotifier {
  String courseName;
  String id;
  String description;
  num stars;
  String authorImage;
  String author;
  bool enrolled;
  String price;
  String enrollCount;
  Map<String, dynamic> curriculum;
  List<String> tags;
  List<String> requirments;
String genre;

  CourseContentModel(
      {required this.id,
      required this.courseName,
      required this.genre,
      required this.tags,
      required this.requirments,
      required this.description,
      required this.authorImage,
      required this.stars,
      required this.author,
      required this.price,
      required this.enrolled,
      required this.enrollCount,
      required this.curriculum});
}
