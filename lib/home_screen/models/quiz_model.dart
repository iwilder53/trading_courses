import 'package:flutter/material.dart';

class Quiz with ChangeNotifier {
  String name;
  String id;
  num duration;
  bool completed;

  Quiz(
      {required this.id,
      required this.duration,
      required this.completed,
      required this.name});
     
}
