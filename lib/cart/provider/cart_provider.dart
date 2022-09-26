import 'package:flutter/material.dart';

import '../../home_screen/models/course_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Course> _cartCourses = [];
  double itemsTotal = 0.00;
  double totalGst = 0.00;
  double walletUsed = 0.00;
  double toPay = 0.00;

  void addCourse(Course course) {
    if (course.price != 'FREE') {
      itemsTotal = itemsTotal + double.parse(course.price);
    }
    _cartCourses.add(course);
    changeCartValues(itemsTotal);

    notifyListeners();
  }

  void removeCourse(Course course) {
    final itemToRemove =
        _cartCourses.indexWhere((element) => element.id == course.id);
    if (course.price != 'FREE')
      itemsTotal = itemsTotal - double.parse(course.price);

    _cartCourses.removeAt(itemToRemove);
    changeCartValues(itemsTotal);

    print(_cartCourses);
    notifyListeners();
  }

  void changeCartValues(double price) {
    totalGst = (itemsTotal / 100) * 18;
    toPay = totalGst + itemsTotal;
    notifyListeners();
  }

  get cartCourses {
    return _cartCourses;
  }
}
