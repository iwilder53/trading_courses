import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final String id;

  const CourseWidget(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(id);
  }
}
