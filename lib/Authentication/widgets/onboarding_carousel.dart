
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/intro_image_list.dart';

class OnboardingCarousel extends StatelessWidget {
  const OnboardingCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true, autoPlayInterval: const Duration(seconds: 2)),
      items: imgList
          .map((item) =>
              Center(child: SvgPicture.asset(item)))
          .toList(),
    );
  }
}
