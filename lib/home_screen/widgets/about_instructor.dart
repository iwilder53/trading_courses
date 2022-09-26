import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../screens/instructor.dart';

class AboutInstructor extends StatelessWidget {
  const AboutInstructor({
    Key? key,
    required this.dW,
    required this.courseDetails,
  }) : super(key: key);

  final double dW;
  final Course courseDetails;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        /*  margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ), */
        height: dW * 0.25,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: dW * 0.2,
                child: Image.asset('assets/images/course_1.png')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseDetails.author,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    'SEBI Registered Advisor',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/Vector-2.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/Vector.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/Facebook.png'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InstructorScreen(id: 1,)));
                },
                icon: Image.asset('assets/images/Chevron.png'))
          ],
        ));
  }
}
