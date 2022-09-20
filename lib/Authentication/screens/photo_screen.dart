import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trading_courses/helpers/common_functions.dart';
import 'package:trading_courses/navigation/navigators.dart';
import 'package:trading_courses/navigation/routes.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;

    return Scaffold(
      body: Stack(children: [
        Column(children: [
          SizedBox(
            height: display_height * 0.04,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 40, right: 20),
            child: const Text(
              'Step 1 of 2',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff737373)),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 40, left: 20),
              child: const Text(
                'Welcome \nLets make a profile',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20, top: 10),
              child: const Text(
                'Add a photo so that other members\nknow who you are',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff737373)),
              )),
          SizedBox(
            height: display_height * 0.06,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://googleflutter.com/sample_image.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: display_height * 0.25,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Container(
                  width: display_width,
                  height: display_height * 0.08,
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MobileScreen() ) );
                    },
                    child: Text(
                      "Upload a photo",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: (() =>
                          {push(context, NamedRoute.infoRegistrationScreen)}),
                      child: Text(
                        'Skip for now',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff737373)),
                      ),
                    )),
              ],
            ),
          )
        ]),
      ]),
    );
  }
}
