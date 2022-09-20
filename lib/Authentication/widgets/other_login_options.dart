import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class OtherLoginOptions extends StatelessWidget {
  const OtherLoginOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.all(20),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        IconButton(
            padding: EdgeInsets.symmetric(horizontal: 40),
            onPressed: (() => {}),
            icon: SvgPicture.asset('assets/svg/google.svg')),
        IconButton(
            padding: EdgeInsets.symmetric(horizontal: 15),
            onPressed: (() => {}),
            icon: SvgPicture.asset('assets/svg/apple.svg')),
        IconButton(
            padding: EdgeInsets.symmetric(horizontal: 40),
            onPressed: (() => {}),
            icon: SvgPicture.asset('assets/svg/facebook.svg')),
      ]),
    );
  }
}
