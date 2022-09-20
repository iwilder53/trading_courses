import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../models/intro_image_list.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      child: 
           CarouselSlider(
        options: CarouselOptions( autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2)),
        items: imgList
            .map((item) => Container(
                  child: Center(
                      child:
                          SvgPicture.asset(item)),
                ))
            .toList(),
      ),
        );
    }
    }
