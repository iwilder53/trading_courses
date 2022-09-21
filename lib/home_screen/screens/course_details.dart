import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/navigation/navigators.dart';

import '../providers/courses.dart';
import '../widgets/TitleText.dart';

class CourseDetailScreen extends StatelessWidget {
  final int id;
  const CourseDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;

    final courseData = Provider.of<Courses>(context);
    final courseDetails = courseData.freeCourses[id];
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
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (() {
                        pop(context);
                      }),
                      icon: SvgPicture.asset('assets/svg/back_arrow.svg')),
                  IconButton(
                      onPressed: (() {}),
                      icon: SvgPicture.asset('assets/svg/bookmark.svg')),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(courseDetails.author),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    width: dW * 0.06,
                    height: dW * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  courseDetails.courseName,
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  courseDetails.genre,
                  style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff3199D8)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/svg/star.svg'),
                        ),
                        Text('${courseDetails.stars}(${courseDetails.enrollCount})Enrolled'),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        courseData.enrollFree(courseDetails.id);
                        if (kDebugMode) {
                          print(courseDetails.enrolled);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1.0, color: Colors.black),
                      ),
                      /* ButtonStyle(
                        shape: MaterialStateProperty.all(
                          
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                      ), */
                      child: Text(
                        courseDetails.enrolled
                            ? 'Enrolled'
                            : courseDetails.price,
                        // "Enroll",
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('beginner'),
                  Text('20 modules'),
                  Text('4 hours'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: dH * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleText(title: 'Course Highlights'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('\u2022 20 Modules',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.55,
                                  )),
                              Text('\u2022  4 Hours of Interactive Content',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    height: 1.55,
                                  )),
                              Text('\u2022  Level Of Content Beginner',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.55,
                                  )),
                              Text('\u2022 ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.55,
                                  )),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: dH * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TitleText(title: 'About Course'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            //  height: 1.55,
                          ),
                          'This Course is a comprehensive course in  stock market trading that will take you from beginner to advance level.\n\nYou will be able to trade like a professional trader and start earning regular income after a few months of practice with our support. More...'),
                    ),
                  ],
                ),
              ),
              const TitleText(title: 'Curriculum'),
            ],
          ),
        ),
      ),
    );
  }
}
