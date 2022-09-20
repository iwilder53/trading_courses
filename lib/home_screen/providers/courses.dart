import 'package:flutter/material.dart';

import '../models/course_model.dart';

class Courses extends ChangeNotifier {
  String courseName = "";
  String description = "";
  bool enrolled = false;
  String id = "";
  String subTitle = "";
  late Map<String, dynamic> courseContent;

  final List<Course> _freeCourses = [
    Course(
        id: '1',
        courseName: 'Money Making Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: 'Free',
        author: 'Tushar R. Gone',
        reviewCount: '1200+',
        description: 'something something',
        enrolled: false,
        bgColor: Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\n wealth for your\n future days',
        courseContent: {
          "Welcome Session": [
            "1.1 How can you access the MMTC course",
            "1.2 How to get connected to the community",
            "How to effectively complete the course"
          ],
          "Concepts of trading": [],
          "Tools for trading": [],
          "Concepts of trading": [],
          "Tools for trading": [],
          "Concepts of trading": [],
          "Tools for trading": []
        }),
    Course(
        id: '2',
        courseName: 'Stock Market Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: 'Free',
        bgColor: Color(0xffE9F4EC),
        bannerImage: 'assets/images/course_2.png',
        bannerText: 'Begginer to Expert\n in less than a week\n time',
        author: 'Tushar R. Gone',
        reviewCount: '1200+',
        description: 'something something',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        }),
    Course(
        id: '3',
        courseName: 'Money Making Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        bgColor: Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\n wealth for your\n future days',
        price: 'Free',
        author: 'Tushar R. Gone',
        reviewCount: '1200+',
        description: 'something something',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        }),
    Course(
        id: '4',
        courseName: 'Stock Market Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: 'Free',
        author: 'Tushar R. Gone',
        reviewCount: '1200+',
        description: 'something something',
        bgColor: Color(0xffE9F4EC),
        bannerImage: 'assets/images/course_2.png',
        bannerText: 'Begginer to Expert\n in less than a week\n time',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        })
  ];

  final List<Course> _paidCourses = [
    Course(
        id: '1',
        courseName: 'Money Making Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: '₹999',
        author: 'Tushar R. Gone',
        bgColor: Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\n wealth for your\n future days',
        reviewCount: '1200+',
        description: 'something something',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        }),
    Course(
        id: '2',
        courseName: 'Stock Market Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: '₹499',
        author: 'Tushar R. Gone',
        reviewCount: '1200+',
        description: 'something something',
        bgColor: Color(0xffE9F4EC),
        bannerImage: 'assets/images/course_2.png',
        bannerText: 'Begginer to Expert\n in less than a week\n time',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        }),
    Course(
        id: '3',
        courseName: 'Money Making Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: '₹999',
        author: 'Tushar R. Gone',
        bgColor: Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\n wealth for your\n future days',
        reviewCount: '1200+',
        description: 'something something',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        }),
    Course(
        id: '4',
        courseName: 'Stock Market Trading Course',
        subTitle: 'Learn and grow your wealth for your future days',
        stars: 4.8,
        price: '₹499',
        author: 'Tushar R. Gone',
        bgColor: Color(0xffE9F4EC),
        bannerImage: 'assets/images/course_2.png',
        bannerText: 'Begginer to Expert\n in less than a week\n time',
        reviewCount: '1200+',
        description: 'something something',
        enrolled: false,
        courseContent: {
          "module_1": ["somehting", "somehting2"],
        })
  ];

  List<Course> get freeCourses {
    return [..._freeCourses];
  }

  List<Course> get paidCourses {
    return [..._paidCourses];
  }

  void enrollFree(String id) {
    final enrolmentToChange = _freeCourses.firstWhere((crs) => crs.id == id);
    enrolmentToChange.enrolled = !enrolmentToChange.enrolled;
    notifyListeners();
  }

  void enrollPaid(String id) {
    final enrolmentToChange = _paidCourses.firstWhere((crs) => crs.id == id);
    enrolmentToChange.enrolled = !enrolmentToChange.enrolled;
    notifyListeners();
  }
}
