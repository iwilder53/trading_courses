import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/course_content_model.dart';
import '../models/quiz_model.dart';

class CourseContentProvider extends ChangeNotifier {
  String name = "";
  num duration = 0;
  bool completed = false;
  String id = "";

  final List<CourseContentModel> _courseData = [
    CourseContentModel(
        id: '1',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: {
          'Module 1': ['class 1 ', 'class 2 ', 'class 3 ']
        },
        authorImage: '',
        description:
            'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
        author: 'Tushar R. Ghone',
        tags: ['Stock Market', 'Trading']),
  ];

  List<CourseContentModel> get courseData {
    return [..._courseData];
  }

  void enroll(String id) {
    final enrolmentToChange = _courseData.firstWhere((crs) => crs.id == id);
    enrolmentToChange.enrolled = !enrolmentToChange.enrolled;
    notifyListeners();
  }
}
