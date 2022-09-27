import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_courses/navigation/navigators.dart';
import 'package:trading_courses/navigation/routes.dart';

class CheckoutSuccessfulScreen extends StatelessWidget {
  const CheckoutSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(dW * 0.1),
          color: Colors.white,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    'assets/svg/Confetti.svg',
                    width: dW * 0.8,
                  )),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: dW * 0.8,
                    ),
                    SvgPicture.asset(
                      'assets/svg/check-circle.svg',
                    ),
                    Padding(
                      padding: EdgeInsets.all(dW * 0.02),
                      child: Text(
                        'ENROLLMENT SUCCESS',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.clip),
                      ),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: const Color(0xff737373),
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.clip,
                            ),
                        'Some text line to appreciate and motivate the user briefly in one or two lines.'),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
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
                  push(context, NamedRoute.dashboardScreen);
                  //task to execute when this button is pressed
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: dW * 0.05, vertical: dW * 0.02),
                    child: Text(
                      'LETS GET STARTED',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: const Color(0xff3199D8),
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.clip),
                    )),
                //
              )),
        ));
  }
}
