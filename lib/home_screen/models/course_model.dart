import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/review_model.dart';
import 'module_model.dart';

class Course with ChangeNotifier {
  late String courseName;
  late String id;
  late String subTitle;
  late String description;
  late num stars;
  late Color bgColor;
  late String bannerImage;
  late String bannerText;
  late String author;
  late bool enrolled;
  late String price;
  late String reviewCount;
  late Map<String, dynamic> courseContent;
  late bool isExpanded;
  late String enrollCount;
  late List<Module> curriculum;
  late List<String> tags;
  late List<String> requirments;
  late String genre;
  late String duration;
  late String difficulty;
  late List<ReviewModel> reviews;
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

  Course.fromJson(Map<String, dynamic> json) {
    tags = List.castFrom<dynamic, String>(json['tags']);
    requirments = List.castFrom<dynamic, String>(json['requirments']);
    id = json['id'];
    courseName = json['courseName'];
    subTitle = json['subTitle'];
    description = json['description'];
    genre = json['genre'];
    stars = json['stars'];
    enrollCount = json['enrollCount'];
    price = json['price'];
    enrolled = json['enrolled'];
    duration = json['duration'];
    difficulty = json['difficulty'];
    bannerText = json['bannerText'];
    reviewCount = json['reviewCount'];
    curriculum =
        List.from(json['curriculum']).map((e) => Module.fromJson(e)).toList();
    author = json['author'];
    reviews =
        List.from(json['reviews']).map((e) => ReviewModel.fromJson(e)).toList();
  }
}
