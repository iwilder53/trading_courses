import 'package:flutter/material.dart';

import '../../home_screen/models/course_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Course> _cartCourses = [];
  double itemsTotal = 0.00;
  double totalGst = 0.00;
  double walletUsed = 0.00;
  double toPay = 0.00;

  void addCourse(Course course) {
    /* 
    _cartCourses.contains(course)?
    _cartCourses.add(course):null; */
    if (!_cartCourses.contains(course)) {
      if (course.price != 'FREE') {
        itemsTotal += double.parse(course.price);
      }
      _cartCourses.add(course);
      changeCartValues();
    }

    notifyListeners();
  }

  void removeCourse(Course course) {
    final itemToRemove =
        _cartCourses.indexWhere((element) => element.id == course.id);
    if (course.price != 'FREE') {
      itemsTotal -= double.parse(course.price);
    }

    _cartCourses.removeAt(itemToRemove);
    changeCartValues();

    //  print(_cartCourses);
    notifyListeners();
  }

  void changeCartValues() {
    totalGst = (itemsTotal / 100) * 18;
    toPay = totalGst + itemsTotal;
    notifyListeners();
  }

  void checkout() {
    _cartCourses.clear();
    itemsTotal = 0;
    changeCartValues();
  }

  get cartCourses {
    return _cartCourses;
  }
}
