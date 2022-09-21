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
      genre: 'Stock Market',
      stars: 4.8,
      enrollCount: '1200+',
      price: '999',
      requirments: ['smartphone', 'Demat account'],
      enrolled: false,
      curriculum: {
        'Module 1': ['class 1 ', 'class 2 ', 'class 3 ']
      },
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    ),Course(
      id: '2',
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    ),Course(
      id: '3',
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    ),Course(
      id: '4',
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    )
  ];

  final List<Course> _paidCourses = [
   Course(
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    ),
   Course(
      id: '2',
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    ),
    Course(
      id: '3',
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    ),
    Course(
      id: '4',
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
      bgColor: const Color(0xffE9F4EC),
      bannerImage: 'assets/images/course_2.png',
      bannerText: 'Begginer to Expert\n in less than a week\n time',
      reviewCount: '1200+',
      courseContent: {
        "module_1": ["somehting", "somehting2"],
      },
      description:
          'This Course is a comprehensive course in stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...',
      author: 'Tushar R. Ghone',
      tags: ['Stock Market', 'Trading'],
      subTitle: 'Learn and grow your wealth for your future days',
    )
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
