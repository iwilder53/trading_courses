import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String? email ;
  String? fullName ;
  DateTime? dob ;
  String? gender ;
  int? phone ;
  List? enrolledcourses ;
  String? token ;

User({required this.email,required this.fullName,required this.dob,required this.gender,required this.phone,required this.token});
/*   void register(Map<String, dynamic> responseData) {
  token = responseData['token'];
    name = responseData['name'];
    email = responseData['email'];
    dob = responseData['dob'];
    gender = responseData['gender'];
    phone = responseData['phone'];

    notifyListeners();
  } */

  login(Map<String, dynamic> responseData,String accessToken) {
    token = accessToken;
    fullName = responseData['name'];
    email = responseData['email'];
  //  dob = responseData['dob'];
    gender = responseData['gender'];
    phone = responseData['mobileNumber'];

    notifyListeners();
  }
}
