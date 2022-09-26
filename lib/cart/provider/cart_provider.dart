import 'package:flutter/material.dart';

import '../../home_screen/models/course_model.dart';

class CartProvider extends ChangeNotifier {
  List<Course> _cartCourses = [];
  double itemsTotal = 0.00;
  double totalGst = 0.00;
  double walletUsed = 0.00;
  double toPay = 0.00;

  void addCourse(Course course) {
    itemsTotal = itemsTotal + double.parse(course.price);
   
    
    _cartCourses.add(course);
    changeCartValues(itemsTotal);
    notifyListeners();
  }

  void removeCourse(Course course) {
    itemsTotal = itemsTotal - double.parse(course.price);
   
    _cartCourses.remove(course);
    changeCartValues(itemsTotal);
    notifyListeners();

  }
  void changeCartValues(double price){
    totalGst = (itemsTotal / 100) * 18;
    toPay = totalGst + itemsTotal;
    notifyListeners();

  }
  get cartCourses {
    return _cartCourses;
  }
}
