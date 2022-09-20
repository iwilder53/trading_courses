import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final String id;

  CourseWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Text(id);
  }
}
