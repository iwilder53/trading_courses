import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_courses/home_screen/providers/courses.dart';
import 'package:trading_courses/home_screen/providers/instructor_provider.dart';
import 'package:trading_courses/home_screen/widgets/TitleText.dart';

import '../../navigation/navigators.dart';
import '../widgets/instructor_course_list.dart';

class InstructorScreen extends StatelessWidget {
  final int id;
  const InstructorScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final instructors = Instructors();
    final instructor = instructors.tusharGhoneDetails;
    final coursesOffered =
        Courses().authorCourses(instructor.name); // instructor.coursesOffered;

    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFBFFF4), Color(0xff98CCEC)])),
      child: Scaffold(
        //   appBar:AppBar(),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (() {
                      pop(context);
                    }),
                    icon: SvgPicture.asset('assets/svg/back_arrow.svg')),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    height: dW * 0.2,
                    width: dW * 0.2,
                    child: Image.asset('assets/images/course_1.png')),
                Text(
                  'Tushar R. Ghone',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SEBI Registered Advisor',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: dW * 0.3, vertical: dW * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Students',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff434343)),
                      ),
                      Text(
                        'Courses',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff434343)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(title: 'About Me'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          color: const Color(0xff434343)),
                      'I have come from a humble Maharashtrian background. I have a never say ‘NO’ attitude to my life right from my childhood. With my dedication and focus, I was able to achieve 17th rank in Maharashtra Technical Board of Diploma in Mechanical Engineering from VJTI, Mumbai. After Engineering I had to do job since I couldn’t afford exorbitant fees of MBA.Finally, in my mid career, I completed by post graduation in Finance Management.'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: dW * 0.15,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Connect with me at '),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/Vector-2.png',
                                  scale: 0.6,
                                )),
                            IconButton(
                              onPressed: () {
                                print(coursesOffered);
                              },
                              icon: Image.asset(
                                'assets/images/Vector.png',
                                scale: 0.6,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/Facebook.png',
                                  scale: 0.6,
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            const TitleText(title: 'Courses'),
            SizedBox(
              height: (dW * 0.25 * instructor.coursesOffered.length),
              width: dW * 0.35 * instructor.coursesOffered.length,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: instructor.coursesOffered.length,
                itemBuilder: (context, index) {
                  return AuthorCourseList(
                    dW: dW,
                    coursesOffered: coursesOffered,
                    index: index,
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
