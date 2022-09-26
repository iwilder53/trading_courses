import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/course_model.dart';

class Instructor extends ChangeNotifier {
  String name;
  String id;
  String designation;
  num studentCount;
  num courseCount;
  String aboutInstructor;
  List socialMedia;
  List<Course> coursesOffered;

  Instructor(
      {required this.name,
      required this.id,
      required this.designation,
      required this.studentCount,
      required this.aboutInstructor,
      required this.courseCount,
      required this.coursesOffered,
      required this.socialMedia});
}
