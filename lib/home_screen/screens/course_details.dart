// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/cart/Provider/cart_provider.dart';
import 'package:trading_courses/home_screen/widgets/my_app_bar.dart';
import 'package:trading_courses/navigation/arguments.dart';
import 'package:trading_courses/navigation/navigators.dart';
import 'package:trading_courses/navigation/routes.dart';
import '../models/course_model.dart';
import '../providers/courses.dart';
import '../widgets/TitleText.dart';
import '../widgets/about_instructor.dart';
import '../widgets/bullet_points.dart';

class CourseDetailScreen extends StatefulWidget {
  final CourseDetailScreenArguments args;
  const CourseDetailScreen({super.key, required this.args});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late Courses courseData;
  late Course courseDetails;

  @override
  void initState() {
    super.initState();
    // courseData = Provider.of<Courses>(context, listen:false);
  }

  // ignore: prefer_final_fields

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

  generate_tags() {
    return courseDetails.tags.map((tag) => get_chip(tag)).toList();
  }

  List<Map<String, dynamic>> items() => List.generate(
      courseDetails.curriculum.length,
      // courseDetails.curriculum.length,
      (index) => {
            'title': courseDetails.curriculum[index].name,
            'courses': courseDetails.curriculum[index].videos,
            'isExpanded': courseDetails.curriculum[index].isExpanded
          },
      growable: false);

  //  List _courseModules
  void printCurriculum(int index, bool isExpanded) {
    courseData.expand(courseDetails.id, index);

    //  print(courseDetails.curriculum[1].videos.toString());
  }

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;
    courseData = Provider.of<Courses>(context);

    courseDetails = widget.args.free
        ? courseData.freeCourses[widget.args.id]
        : courseData.paidCourses[widget.args.id];

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffFBFFF4), Color(0xff98CCEC)])),
        child: Scaffold(
          appBar: MyAppBar(dW: dW),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                /* Row(
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
                          if (kDebugMode) {
                            print(courseDetails.enrolled.toString() +
                                courseDetails.id);
                          }
/* 
                          if (widget.args.free) {
                            push(
                              context,
                              NamedRoute.courseEnrolledScreen,
                              arguments: int.parse(courseDetails.id),
                            );
                            /*   Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CourseEnrolledScreen(
                                    id: int.parse(courseDetails.id)))); */
                            !courseDetails.enrolled
                                ? Provider.of<Courses>(context, listen: false)
                                    .enrollFree(courseDetails.id)
                                : null;
                          } else {
                            Provider.of<CartProvider>(context, listen: false)
                                .addCourse(courseDetails);
                            /*    Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CheckoutScreen())); */
                            push(context, NamedRoute.checkoutScreen);
                          } */
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
                        child: Text(
                          courseDetails.enrolled
                              ? 'Enrolled'
                              : '₹${courseDetails.price}',
                          // "Enroll",
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                BulletPoints(courseDetails: courseDetails),
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
                      children: items()
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
                const TitleText(title: 'About Instructor'),
                AboutInstructor(dW: dW, courseDetails: courseDetails),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TitleText(title: 'Tags'),
                ),
                Container(
                  height: dW * 0.2,
                  width: dW * 0.2,
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: <Widget>[...generate_tags()],
                  ),
                ),
                const TitleText(title: 'Reviews'),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: dW,
                  width: dW,
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    courseDetails.reviews[index].name
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/star.svg'),
                                        SvgPicture.asset('assets/svg/star.svg'),
                                        SvgPicture.asset('assets/svg/star.svg'),
                                        SvgPicture.asset('assets/svg/star.svg')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Text(courseDetails
                                        .reviews[index].description),
                                  )
                                ]);
                          }),
                      TextButton(
                          onPressed: () {},
                          child: const Text('See More Reviews'))
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            //  decoration: BoxDecoration(boxShadow: BoxShadow(offset: 10)),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: dW * 0.15,
            width: dW,
            child: FloatingActionButton(
              elevation: 15.0,

              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              onPressed: () {
                //  print("Button is pressed.");
                if (widget.args.free) {
                  pushReplacement(
                    context,
                    NamedRoute.courseEnrolledScreen,
                    arguments: int.parse(courseDetails.id),
                  );
                  /*   Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CourseEnrolledScreen(
                                    id: int.parse(courseDetails.id)))); */

                  !courseDetails.enrolled
                      ? Provider.of<Courses>(context, listen: false)
                          .enrollFree(courseDetails.id)
                      : null;
                } else {
                  Provider.of<CartProvider>(context, listen: false)
                      .addCourse(courseDetails);

                  /*    Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CheckoutScreen())); */
                  pushReplacement(context, NamedRoute.checkoutScreen);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ENROLL NOW',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: const Color(0xff3199D8),
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Image.asset('assets/images/Chevron.png'),
                  ],
                ),
              ), //
            ),
          ),
        ));
  }
}
