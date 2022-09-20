import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dH = dS.height;
    return Container(
        margin: EdgeInsets.all(20),
        child: const Text(
          'By continuing you agree to the terms of service \nand privacy policy',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
    
    );
  }
}
