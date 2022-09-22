import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/review_model.dart';

import 'module_model.dart';

class Course with ChangeNotifier {
  String courseName;
  String id;
  String subTitle;
  String description;
  num stars;
  Color bgColor;
  String bannerImage;
  String bannerText;
  String author;
  bool enrolled;
  String price;
  String reviewCount;
  Map<String, dynamic> courseContent;
  bool isExpanded;
  String enrollCount;
  List<Module> curriculum;
  List<String> tags;
  List<String> requirments;
  String genre;
  String duration;
  String difficulty;
  List<ReviewModel> reviews;
  Course(
      {required this.id,
      required this.courseName,
      required this.genre,
      required this.tags,
      required this.reviews,
      required this.isExpanded,
      required this.requirments,
      required this.description,
      required this.stars,
      required this.duration,
      required this.difficulty,
      required this.author,
      required this.price,
      required this.enrolled,
      required this.enrollCount,
      required this.curriculum,
      required this.subTitle,
      required this.bannerImage,
      required this.bgColor,
      required this.bannerText,
      required this.reviewCount,
      required this.courseContent});
}
