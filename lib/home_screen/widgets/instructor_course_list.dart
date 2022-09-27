import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_courses/home_screen/screens/course_details.dart';
import 'package:trading_courses/navigation/arguments.dart';

import '../models/course_model.dart';
import '../screens/course_ernrolled.dart';

class AuthorCourseList extends StatelessWidget {
  const AuthorCourseList({
    Key? key,
    required this.dW,
    required this.index,
    required this.coursesOffered,
  }) : super(key: key);
  final int index;
  final double dW;
  final List<Course> coursesOffered;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => coursesOffered[index].enrolled
                ? CourseEnrolledScreen(
                    id: int.parse(coursesOffered[index].id) - 1,
                  )
                : CourseDetailScreen(args: CourseDetailScreenArguments(
                    id: int.parse(coursesOffered[index].id) - 1,
                    free:
                        coursesOffered[index].price == 'FREE' ? true : false),)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              height: dW * 0.25,
              width: dW * 0.35,
              child: (int.parse(coursesOffered[index].id) - 1).isEven
                  ? Image.asset('assets/images/course_1.png')
                  : Image.asset('assets/images/course_2.png'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coursesOffered[index].courseName,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        overflow: TextOverflow.fade,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/star.svg'),
                      Text(
                        '4.8 (1200+)',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff434343)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      coursesOffered[index].price,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: const Color(0xff434343)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
