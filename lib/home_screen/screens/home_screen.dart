// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/home_screen/providers/quiz_provider.dart';
import 'package:trading_courses/home_screen/widgets/help_videos.dart';
import 'package:trading_courses/home_screen/widgets/paid_courses.dart';

import '../widgets/quiz_grid_tile.dart';
import '../models/homepage_carousel_items.dart';
import '../../Authentication/models/user.dart';
import '../models/quiz_model.dart';
import '../widgets/free_courses.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
 

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
 
  @override
  Widget build(BuildContext context) {
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;
    final carouselController = CarouselController();

    final quizData = Provider.of<QuizProvider>(context);
    final quizes = quizData.quizes;
    return Consumer<User>(builder: (context, user, _) {
      return MaterialApp(
        home: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffFBFFF4), Color(0xff98CCEC)])),
          child: Scaffold(
            /*  bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_max_outlined),
                  label: 'Home',
                  backgroundColor: Colors.black,
                ),
              ],
            ), */
            backgroundColor: Colors.transparent,
            body: ListView(
              // shrinkWrap: true,
              //  padding: EdgeInsets.all(display_width * 0.04),
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
                            user.name,
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
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2)),
                  items: homeCarouselImgList
                      .map((item) => Container(
                            child: Center(child: SvgPicture.asset(item)),
                          ))
                      .toList(),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Continue Learning',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                Container(
                    width: display_width * 0.6,
                    height: display_height * 0.08,
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
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
                FreeCourses(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Paid Courses',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
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
                Container(
                  height: display_height * 0.4,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
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
                  //  height: display_height * 0.4,
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
                  height: display_height * 0.4,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
