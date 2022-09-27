import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String email = "";
  String name = "";
  String dob = "";
  String gender = "";
  List enrolledCourses = [];

  void register(
    String emailTxt, String nameTxt, String dobTxt, String genderTxt) {
    email = emailTxt;
    name = nameTxt;
    dob = dobTxt;
    gender = genderTxt;

    notifyListeners();
  }

  
}
