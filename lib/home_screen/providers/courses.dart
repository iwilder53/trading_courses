import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/module_model.dart';
import 'package:trading_courses/home_screen/models/review_model.dart';

import '../models/course_model.dart';

class Courses extends ChangeNotifier {
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
        duration: '4',
        difficulty: 'Begginer',
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: [
            'How to access MMTC course',
            'How to get connected to the community ',
            'How to complete the course?'
          ]),
          Module(id: '2', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '3', name: 'Tools of trading', videos: ['', '', '']),
        ],
        bgColor: const Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\nwealth for\nyour future days',
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ]),
    Course(
        id: '2',
        courseName: 'Stock Market Basics Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: 'FREE',
        duration: '4',
        difficulty: 'Begginer',
        requirments: ['Smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
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
        price: 'FREE',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        duration: '4',
        difficulty: 'Begginer',
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
        ],
        bgColor: const Color(0xffC6D7F9),
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ]),
    Course(
        id: '4',
        courseName: 'Stock Market Basics Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: 'FREE',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        duration: '4',
        difficulty: 'Begginer',
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
        ],
        bgColor: const Color(0xffE9F4EC),
        bannerImage: 'assets/images/course_2.png',
        bannerText: 'Learn and grow your\nwealth for\nyour future days',
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
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
        price: '₹999',
        duration: '4',
        difficulty: 'Begginer',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
        ],
        bgColor: const Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\nwealth for\nyour future days',
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ],
        id: '2',
        courseName: 'Stock Market Basics Course',
        genre: 'Stock Market',
        stars: 4.8,
        duration: '4',
        difficulty: 'Begginer',
        enrollCount: '1200+',
        price: '₹499',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
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
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
              id: '2',
              name: 'Harish Kumar',
              stars: 4,
              description:
                  'I loved this course. Its exactly what I wanted to learn twenty years ago. Its really helpful to a beginner starting to trading.')
        ],
        stars: 4.8,
        duration: '4',
        difficulty: 'Begginer',
        enrollCount: '1200+',
        price: '₹999',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
        ],
        bgColor: const Color(0xffC6D7F9),
        bannerImage: 'assets/images/course_1.png',
        bannerText: 'Learn and grow your\nwealth for\nyour future days',
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
        courseName: 'Stock Market Basics Course',
        genre: 'Stock Market',
        stars: 4.8,
        enrollCount: '1200+',
        price: '₹499',
        duration: '4',
        difficulty: 'Begginer',
        requirments: ['smartphone', 'Demat account'],
        enrolled: false,
        curriculum: [
          Module(id: '1', name: 'Welcome session', videos: ['', '', '']),
          Module(id: '1', name: 'Concepts of trading', videos: ['', '', '']),
          Module(id: '1', name: 'Tools of trading', videos: ['', '', '']),
        ],
        reviews: [
          ReviewModel(
              id: '1',
              name: 'Joyesh Choaudhary',
              stars: 4,
              description:
                  'This is a great course that beginner can follow along easily. Instructor is also giving tips and tricks for us to remember things easily.Definitely recommend to go for it.'),
          ReviewModel(
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

  void expand(String id, int index) {
    final courseToExpand = _freeCourses.firstWhere((crs) => crs.id == id);
    courseToExpand.curriculum[index].isExpanded =
        !courseToExpand.curriculum[index].isExpanded;
    print(id.toString());
    notifyListeners();
  }

  List<Course> authorCourses(String name) {
    List<Course> courses = [];
    for (int i = 0; i < _freeCourses.length; i++) {
      if (_freeCourses[i].author.contains(name)) {
        courses.add(_freeCourses[i]);
      }
    }
    for (int i = 0; i < _paidCourses.length; i++) {
      if (_paidCourses[i].author.contains(name)) {
        courses.add(_paidCourses[i]);
      }
    }
    return courses;
  }

  void enrollPaid(String id) {
    final enrolmentToChange = _paidCourses.firstWhere((crs) => crs.id == id);
    enrolmentToChange.enrolled = !enrolmentToChange.enrolled;
    notifyListeners();
  }
}
