import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizGridTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;

  final duration; // ignore: prefer_typing_uninitialized_variables

  final completed; // ignore: prefer_typing_uninitialized_variables
  const QuizGridTile({
    super.key,
    required this.name,
    required this.completed,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Text(
                      duration.toString() + ' min',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                completed
                    ? SvgPicture.asset('assets/svg/complete.svg')
                    : SvgPicture.asset('assets/svg/forward_arrow.svg')
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 18, right: 8),
              child: Image.asset(
                'assets/images/quiz_logo.png',
                scale: 1.0,
              ))
        ]),
      ),
    );
  }
}
