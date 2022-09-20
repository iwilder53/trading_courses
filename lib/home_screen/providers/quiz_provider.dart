import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  String name = "";
  num duration = 0;
  bool completed = false;
  String id = "";

  final List<Quiz> _quizes = [
    Quiz(id: '1', name: 'Quiz - 1', duration: 5, completed: true),
    Quiz(id: '2', name: 'Quiz - 2', duration: 5, completed: true),
    Quiz(id: '3', name: 'Quiz - 3', duration: 5, completed: true),
    Quiz(id: '4', name: 'Quiz - 4', duration: 5, completed: false),
  ];

  List<Quiz> get quizes {
    return [..._quizes];
  }

  void enrollFree(String id) {
    final quizToChange = _quizes.firstWhere((crs) => crs.id == id);
    quizToChange.completed = !quizToChange.completed;
    notifyListeners();
  }
}
