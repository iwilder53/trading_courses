
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/course_model.dart';

class BulletPoints extends StatelessWidget {
  const BulletPoints({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final Course courseDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/svg/Vector.svg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(courseDetails.difficulty),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/svg/Vector-1.svg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${courseDetails.curriculum.length} Modules'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/svg/Vector-2.svg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${courseDetails.duration} Hours'),
            ),
          ],
        ),
      ],
    );
  }
}
