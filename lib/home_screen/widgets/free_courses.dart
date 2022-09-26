import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/home_screen/screens/course_details.dart';
import 'package:trading_courses/home_screen/screens/course_ernrolled.dart';
import '../providers/courses.dart';

class FreeCourses extends StatelessWidget {
  const FreeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;
    final courseData = Provider.of<Courses>(context);
    final freeCourses = courseData.freeCourses;
    return SizedBox(
        height: dW * 0.8,
        width: dW * 0.4,
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
                  border: Border.all(color: const Color(0xffC6D7F9)),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              margin: const EdgeInsets.all(8),
              width: dW * 0.8,
              height: dW * 0.3,
              child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {/* 
                    print(
                        freeCourses[i].enrolled.toString() + freeCourses[i].id); */
                
                
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => freeCourses[i].enrolled
                            ? CourseEnrolledScreen(
                                id: int.parse(freeCourses[i].id) - 1,
                              )
                            : CourseDetailScreen(
                                id: int.parse(freeCourses[i].id) - 1,
                                free: true,
                               
                              )));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/star.svg'),
                            Text(
                                '${freeCourses[i].stars} (${freeCourses[i].reviewCount})'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: dW * 0.4,
                              child: Image.asset(
                                freeCourses[i].bannerImage,
                              )),
                          Text(
                              style: const TextStyle(color: Color(0xff4C6FFF)),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              freeCourses[i].bannerText)
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
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
                              style: (const TextStyle(
                                  fontFamily: 'Montserrat',
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                            ),
                            Text(
                              textAlign: TextAlign.left,
                              freeCourses[i].subTitle,
                              style: (const TextStyle(
                                  overflow: TextOverflow.ellipsis,
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
                                  style: (const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff737373))),
                                ),
                                Text(
                                  freeCourses[i].price,
                                  style: (const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,

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
