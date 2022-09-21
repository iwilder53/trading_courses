// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';

class HelpVideos extends StatelessWidget {
  final image;
  final title;
  final duration;
  const HelpVideos(
      {super.key,
      required this.image,
      required this.title,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                duration + ' min',
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ]);
  }
}
