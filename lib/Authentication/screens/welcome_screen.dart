import 'package:flutter/material.dart';

import '../widgets/onboarding_carousel.dart';
import 'mobile_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;

    return Scaffold(
        body: Column(
      children: [
        Column(
          children: [
            // SizedBox(height:),
            Padding(
                padding: EdgeInsets.only(top: dW * 0.5),
                child: OnboardingCarousel(key: key)),
            SizedBox(height: dH * 0.2),
            const Text('Learn to trade \nanytime,anywhere',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'Montserrat')),
            SizedBox(
              height: dH * 0.05,
            ),
            SizedBox(
              width: dW * 0.9,
              height: dW * 0.12,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MobileScreen()));
                },
                child: const Text("Start Learning"),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
