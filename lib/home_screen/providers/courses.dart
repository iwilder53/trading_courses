import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/review_model.dart';

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
        isExpanded: false,
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ]),
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
        isExpanded: false,
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ]),
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
        isExpanded: false,
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ]),
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
        isExpanded: false,
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ])
  ];

  final List<Course> _paidCourses = [
    Course(
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ],
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
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ],
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
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ],
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
        reviews: [
          reviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          reviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
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
