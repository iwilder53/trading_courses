// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final title;
  final dW;
  const TitleText({Key? key, required this.title, required this.dW})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(dW * 0.02),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
