import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/home_screen/screens/course_details.dart';
import 'package:trading_courses/navigation/navigators.dart';
import 'package:trading_courses/navigation/routes.dart';

import '../providers/courses.dart';
import 'course_widget.dart';

class FreeCourses extends StatelessWidget {
  const FreeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;
    final courseData = Provider.of<Courses>(context);
    final freeCourses = courseData.freeCourses;
    return Container(
        height: display_height * 0.42,
        child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
            // left: 5.0,
            bottom: 40,
          ),
          itemCount: freeCourses.length,
          itemBuilder: (ctx, i) => Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: freeCourses[i].bgColor,
                  border: Border.all(color: Color(0xffC6D7F9)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              margin: EdgeInsets.all(16),
              width: display_width * 0.8,
              height: display_height * 0.3,
              child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    print('object');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CourseDetailScreen(
                              id: 0,
                            )));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/star.svg'),
                            Text(freeCourses[i].stars.toString() +
                                ' (' +
                                freeCourses[i].reviewCount +
                                ')'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              width: display_width * 0.4,
                              child: Image.asset(
                                freeCourses[i].bannerImage,
                              )),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                style: TextStyle(color: Color(0xff4C6FFF)),
                                textAlign: TextAlign.right,
                                freeCourses[i].bannerText),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            //  border: Border.all(color: Color(0xffC6D7F9)),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        //   color: Colors.white,
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //   textAlign: TextAlign.left,
                              freeCourses[i].courseName,
                              style: (TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                            ),
                            Text(
                              textAlign: TextAlign.left,
                              freeCourses[i].subTitle,
                              style: (TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff737373))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  freeCourses[i].author,
                                  style: (TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff737373))),
                                ),
                                Text(
                                  freeCourses[i].price,
                                  style: (TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w200,
                                      color: Color(0xff737373))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
