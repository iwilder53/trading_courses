import 'package:flutter/material.dart';

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

  Course(
      {required this.id,
      required this.courseName,
      required this.description,
      required this.subTitle,
      required this.bannerImage,
      required this.bgColor,
      required this.bannerText,
      required this.stars,
      required this.author,
      required this.price,
      required this.enrolled,
      required this.reviewCount,
      required this.courseContent});
}
