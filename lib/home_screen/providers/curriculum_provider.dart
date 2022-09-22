import 'package:flutter/material.dart';
import 'package:trading_courses/home_screen/models/curriculum_model.dart';

class CurriculumProvider extends ChangeNotifier {
  final module1 = CurriculumModel(
    id: '1',
    modules: [
      {
        "01 - Welcome Session": [
          "How to access MMTC course ",
          "How to get connected to the community ",
          "How to complete the course?"
        ],
      },
      {
        "module2": ["class1", "class2"],
      }
    ],
    isExpanded: true,
  );
}
