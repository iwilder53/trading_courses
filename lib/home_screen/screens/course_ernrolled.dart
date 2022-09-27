// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/navigation/navigators.dart';

import '../providers/courses.dart';
import '../widgets/TitleText.dart';
import '../widgets/about_instructor.dart';
import '../widgets/bullet_points.dart';
import '../widgets/my_app_bar.dart';

class CourseEnrolledScreen extends StatefulWidget {
  final int id;
  const CourseEnrolledScreen({super.key, required this.id});

  @override
  State<CourseEnrolledScreen> createState() => _CourseEnrolledScreen();
}

class _CourseEnrolledScreen extends State<CourseEnrolledScreen> {
  @override
  void initState() {
    super.initState();
  }

  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;
    final courseData = Provider.of<Courses>(context);
    final courseDetails = courseData.freeCourses[widget.id];

    get_chip(name) {
      return Chip(
          padding: const EdgeInsets.all(-2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: const Color(0xff3199D8),
          label: Text(
            "#$name",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontFamily: 'Montserrat',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ));
    }

    // ignore: unused_element
    generate_tags() {
      return courseDetails.tags.map((tag) => get_chip(tag)).toList();
    }

    List<Map<String, dynamic>> items = List.generate(
        courseDetails.curriculum.length,
        // courseDetails.curriculum.length,
        (index) => {
              'id': courseDetails.curriculum[index].id,
              'title': courseDetails.curriculum[index].name,
              'courses': courseDetails.curriculum[index].videos,
              'isExpanded': courseDetails.curriculum[index].isExpanded
            },
        growable: false);

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffFBFFF4), Color(0xff98CCEC)])),
        child: Scaffold(
          //   appBar:AppBar(),
          appBar: MyAppBar(
            dW: dW,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (() {
                          pop(context);
                        }),
                        icon: SvgPicture.asset('assets/svg/back_arrow.svg')),
                    IconButton(
                        onPressed: (() {}),
                        icon: Image.asset('assets/images/share.png')),
                  ],
                ), */
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(courseDetails.author),
                    ),
                    /*  Container(
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
                  ), */
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
                          Text(
                            '${courseDetails.stars} (${courseDetails.enrollCount})Enrolled',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          courseData.enrollFree(courseDetails.id);
                          pop(context);
                          if (kDebugMode) {
                            // print(courseDetails.enrolled);
                            print(courseDetails.enrolled.toString() +
                                courseDetails.id);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side:
                              const BorderSide(width: 1.0, color: Colors.black),
                        ),
                        /* ButtonStyle(
                        shape: MaterialStateProperty.all(
                          
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                      ), */
                        child: const Text(
                          //courseDetails.enrolled
                          'Enrolled',

                          // "Enroll",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                BulletPoints(courseDetails: courseDetails),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AboutInstructor(dW: dW, courseDetails: courseDetails),
                ),
                const TitleText(title: 'MODULES'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    color: Colors.transparent,
                    height: dW * 0.8,
                    width: dH,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (_, index) {
                          final item = items[index];
                          return /* Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            child: */
                              Card(
                            key: PageStorageKey(item['id']),
                            color: Colors.transparent,
                            elevation: 4,
                            child: ExpansionTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              childrenPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              maintainState: true,
                              title: Text(item['title']),
                              // contents
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item['courses'][0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item['courses'][1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item['courses'][2],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            // ),
                          );
                        }),
                    /* SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: ExpansionPanelList(
                        elevation: 0,
                        dividerColor: Colors.transparent,
                        expandedHeaderPadding: EdgeInsets.all(2),
                        expansionCallback: (index, isExpanded) {
                          printCurriculum(index, isExpanded);
                        },
                        animationDuration: const Duration(milliseconds: 600),
                        children: _items
                            .map(
                              (item) => ExpansionPanel(
                                backgroundColor: Colors.transparent,
                                canTapOnHeader: true,
                                headerBuilder: (_, isExpanded) => Stack(
                                    // alignment: Alignment.centerRight,
                                    children: [
                                      Align(
                                        //  alignment: Alignment.centerRight,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(left: dW * 0.05),
                                          width: dW,
                                          height: dW * 0.1,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "0${item['id']} ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                          ),
                                          Container(
                                              height: dW * 0.11,
                                              width: dW * 0.6,
                                              decoration: const BoxDecoration(
                                                  //   color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(
                                                left: dW * 0.02,
                                              ),
                                              child: Text(
                                                item['title'],
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    ]),
                                body: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item['courses'][0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item['courses'][1],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item['courses'][2],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isExpanded: item['isExpanded'],
                              ),
                            )
                            .toList(),
                      ),
                    ), */
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
