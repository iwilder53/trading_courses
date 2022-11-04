// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/Authentication/providers/auth_provider.dart';
import 'package:trading_courses/home_screen/models/course_model.dart';
import 'package:trading_courses/home_screen/providers/quiz_provider.dart';
import 'package:trading_courses/home_screen/widgets/help_videos.dart';
import 'package:trading_courses/home_screen/widgets/paid_courses.dart';

import '../providers/courses.dart';
import '../widgets/quiz_grid_tile.dart';
import '../models/homepage_carousel_items.dart';
import '../../Authentication/models/user.dart';
import '../widgets/free_courses.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  Future<List<Course>> getCourses(String token, Courses courseData) async {
    final List<Course> courseList = await courseData.getCourses(token);
    return courseList;
  }

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;
    final carouselController = CarouselController();
    late User user = Provider.of<AuthProvider>(context, listen: false).user;
    String userName = user.fullName!;
    final quizData = Provider.of<QuizProvider>(context);
    final quizes = quizData.quizes;
    final coursePovider = Provider.of<Courses>(context);
    final courses = getCourses(user.token!, coursePovider);
    //  return Consumer<User>(builder: (context, user, _) {
    return Container(
      //  padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFBFFF4), Color(0xff98CCEC)])),
      child: Scaffold(
        //  extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        /*  appBar: MyAppBar(
            userName: user.name,
            dW: dW,
          ), */
        body: ListView(
          // shrinkWrap: true,
          //  padding: EdgeInsets.all(dW * 0.04),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      Text(
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                        userName,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 24,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/svg/google_icon.svg'),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        size: 24,
                      ))
                ],
              ),
            ),
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: dW * 0.5,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4)),
              items: homeCarouselImgList
                  .map((item) => Container(
                        width: dW,
                        child: SvgPicture.asset(
                          item,
                          fit: BoxFit.fill,
                          width: dW,
                        ),
                      ))
                  .toList(),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Continue Learning',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                )),
            Container(
                width: dW * 0.6,
                height: dH * 0.08,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Money Making Trading Course',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '5/20 Modules',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.navigate_next_outlined)),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Free Courses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff434343)),
                    ))
              ],
            ),
            FreeCourses(
              courseList: courses,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Paid Courses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text('See All',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff434343))))
              ],
            ),
            PaidCourses(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Quiz',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff434343)),
                    ))
              ],
            ),
            SizedBox(
              height: dH * 0.4,
              child: GridView.builder(
                // padding: const EdgeInsets.all(10.0),
                itemCount: 4, // quizes.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: quizes[i],
                  child: QuizGridTile(
                    name: quizes[i].name,
                    duration: quizes[i].duration,
                    completed: quizes[i].completed,
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
              ),
              /*  GridView.count(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    children: [
                      QuizGridTile(),
                      QuizGridTile(),
                      QuizGridTile(),
                      QuizGridTile()
                    ],
                  ), */
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Help Videos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text('See All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff434343),
                        )))
              ],
            ),
            Container(
              //  height: dH * 0.4,
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HelpVideos(
                    title: 'How to buy a free\ncourse?',
                    duration: '2',
                    image: 'assets/images/vid_1.png',
                  ),
                  HelpVideos(
                    title: 'How to Refer and\nEarn?',
                    duration: '2',
                    image: 'assets/images/vid_2.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dH * 0.4,
            )
          ],
        ),
      ),
    );
  }
}
