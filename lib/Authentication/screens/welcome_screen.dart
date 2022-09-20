import 'package:flutter/material.dart';
import 'package:trading_courses/navigation/navigators.dart';

import '../widgets/intro_carousel.dart';
import 'mobile_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
  final display_size = MediaQuery.of(context).size;
  final display_width = display_size.width;
  final display_height = display_size.height;

    return Scaffold(
      body: Column(
        
      children: [
SizedBox(height: display_height * 0.2,),       
 Carousel(
          key: key,
        ),
        SizedBox(height: display_height * 0.2,),       

      const  Text('Learn to trade, \nanytime anywhere', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24 ), ),
                    SizedBox(height: display_height * 0.05,),       

            Container(
              width: display_width* 0.9,
  child: ElevatedButton(

    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MobileScreen() ) );
    },
    child: Text("Start Learning"),
  ),
),     
        ],
      
      )
    );
  }
}