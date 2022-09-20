import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final title;

  const TitleText({Key? key, required this.title})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
