// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trading_courses/Authentication/screens/welcome_screen.dart';
import 'package:trading_courses/home_screen/screens/instructor.dart';
import 'package:trading_courses/navigation/arguments.dart';
import '../Authentication/screens/info_registration_screen.dart';
import '../Authentication/screens/otp_screen.dart';
import '../Authentication/screens/photo_screen.dart';
import '../home_screen/screens/course_details.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NamedRoute.otpScreen:
      return _getPageRoute(
          OtpScreen(args: settings.arguments as OtpScreenArguments));

    case NamedRoute.photoScreen:
      return _getPageRoute(const PhotoScreen());
    case NamedRoute.courseDetailScreen:
      return _getPageRoute(CourseDetailScreen(
        id: settings.arguments as int,
      ));
    case NamedRoute.courseEnrolledScreen:
      return _getPageRoute(CourseDetailScreen(
        id: settings.arguments as int,
      ));

    case NamedRoute.instructorScreen:
      return _getPageRoute(InstructorScreen(
        id: settings.arguments as int,
      ));

    case NamedRoute.infoRegistrationScreen:
      return _getPageRoute(const PersonalInformationScreen());
    default:
      return _getPageRoute(const WelcomeScreen());
  }
}

PageRoute _getPageRoute(Widget screen) {
  return MaterialPageRoute(builder: (context) => screen);
}
