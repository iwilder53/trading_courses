import 'package:flutter/material.dart';

import '../models/course_model.dart';

class Courses extends ChangeNotifier {
  /*  String courseName = "";
  String description = "";
  bool enrolled = false;
  String id = "";
  String subTitle = "";
  late Map<String, dynamic> courseContent;
 */
  final List<Course> _freeCourses = [
    Course(
        id: '1',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: 'FREE',
        requirments: ['Smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false),
    Course(
        id: '2',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['Smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          },
          {
            "module3": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false),
    Course(
        id: '3',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false),
    Course(
        id: '4',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false)
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
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false),
    Course(
        id: '2',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false),
    Course(
        id: '3',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false),
    Course(
        id: '4',
        courseName: 'Money Making Trading Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          {
            "01 - Welcome Session": [
              "How to access MMTC course ",
              "How to get connected to the community ",
              "How to complete the course?"
            ],
            'isExpanded': true
          },
          {
            "module2": ["class1", "class2"],
            'isExpanded': false
          }
        ],
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
        tags: ['Stock Market', 'Trading', 'nifty50', 'NSE', 'BSE'],
        subTitle: 'Learn and grow your wealth for your future days',
        isExpanded: false)
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

  void expand(String id) {
    final courseToExpand = _freeCourses.firstWhere((crs) => crs.id == id);
    courseToExpand.isExpanded = !courseToExpand.isExpanded;
    print(courseToExpand.isExpanded.toString());
    notifyListeners();
  }

  void enrollPaid(String id) {
    final enrolmentToChange = _paidCourses.firstWhere((crs) => crs.id == id);
    enrolmentToChange.enrolled = !enrolmentToChange.enrolled;
    notifyListeners();
  }
}
