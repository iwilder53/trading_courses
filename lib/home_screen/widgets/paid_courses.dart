import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/courses.dart';
import 'course_widget.dart';

class PaidCourses extends StatelessWidget {
  const PaidCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;
    final courseData = Provider.of<Courses>(context);
    final paidCourses = courseData.paidCourses;
    return Container(
        height: display_height * 0.42,
        child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
            // left: 5.0,
            bottom: 40,
          ),
          itemCount: paidCourses.length,
          itemBuilder: (ctx, i) => Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: paidCourses[i].bgColor,
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
                            Text(paidCourses[i].stars.toString() +
                                ' (' +
                                paidCourses[i].reviewCount +
                                ')'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              width: display_width * 0.4,
                              child: Image.asset(
                                paidCourses[i].bannerImage,
                              )),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                style: TextStyle(color: Color(0xff4C6FFF)),
                                textAlign: TextAlign.right,
                                paidCourses[i].bannerText),
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
                              paidCourses[i].courseName,
                              style: (TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                            ),
                            Text(
                              textAlign: TextAlign.left,
                              paidCourses[i].subTitle,
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
                                  paidCourses[i].author,
                                  style: (TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff737373))),
                                ),
                                Text(
                                  paidCourses[i].price,
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
