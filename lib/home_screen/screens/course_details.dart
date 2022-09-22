import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/navigation/navigators.dart';

import '../providers/courses.dart';
import '../widgets/TitleText.dart';

class CourseDetailScreen extends StatefulWidget {
  final int id;
  const CourseDetailScreen({super.key, required this.id});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
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
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: Color(0xff3199D8),
          label: Text(
            "#${name}",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontFamily: 'Montserrat',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ));
    }

    generate_tags() {
      return courseDetails.tags.map((tag) => get_chip(tag)).toList();
    }

    List<Map<String, dynamic>> _items = List.generate(
        2,
        // courseDetails.curriculum.length,
        (index) => {
              'title': courseDetails.curriculum[index].keys.first.toString(),
              'courses': // ['s', 's', 's'],
                  courseDetails.curriculum[0]
                      [courseDetails.curriculum[0].keys.first.toString()],
              //'courses': courseDetails.curriculum[index].values.toList()[index],
              'isExpanded': courseDetails.isExpanded
            },
        growable: false);

    //  List _courseModules
    void printCurriculum(int index, bool isExpanded) {
      courseData.expand((index + 1).toString());
      // print(_items[0].toString());
      //  print(courseDetails.curriculum[0][0].entries);
      print(courseDetails.curriculum[1]
          [courseDetails.curriculum[1].keys.first.toString()]);
    }

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
                          '${courseDetails.stars}(${courseDetails.enrollCount})Enrolled',
                        ),
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
                              Text('\u2022 Quizes and Resources included',
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
              Container(
                color: Colors.transparent,
                //  height: dW,
                width: dH,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (index, isExpanded) {
                      printCurriculum(index, isExpanded);
                    },
                    animationDuration: const Duration(milliseconds: 600),
                    children: _items
                        .map(
                          (item) => ExpansionPanel(
                            backgroundColor: Colors.transparent,
                            canTapOnHeader: true,
                            headerBuilder: (_, isExpanded) => Container(
                                //color: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                child: Text(
                                  item['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                )),
                            body: Padding(
                              // color: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ),
              const TitleText(title: 'Requirments'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        //  Icon(Icons.smartphone_outlined),
                        Text(
                          courseDetails.requirments[0].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        //  Icon(Icons.smartphone_outlined),
                        Text(
                          courseDetails.requirments[1].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
              ),
              TitleText(title: 'About Instructor'),
              Container(
                  padding: EdgeInsets.all(12),
                  /*  margin: EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ), */
                  height: dW * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: dW * 0.2,
                          child: Image.asset('assets/images/course_1.png')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courseDetails.author,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                            ),
                            Text(
                              'SEBI Registered Advisor',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset('assets/images/Vector-2.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset('assets/images/Vector.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset('assets/images/Facebook.png'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/Chevron.png'))
                    ],
                  )),
              TitleText(title: 'Tags'),
              Container(
                width: dW * 0.2,
                padding: EdgeInsets.all(8),
                height: dW,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: <Widget>[...generate_tags()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
