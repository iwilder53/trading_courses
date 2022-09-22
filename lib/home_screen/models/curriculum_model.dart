import 'package:flutter/material.dart';

class CurriculumModel with ChangeNotifier {
  bool isExpanded;
  String id;
  List<Map<String, dynamic>> modules;
  CurriculumModel({required this.id, required this.isExpanded, required this.modules});
}
