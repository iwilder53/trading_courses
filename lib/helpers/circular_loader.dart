import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CircularLoader extends StatelessWidget {
  const CircularLoader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator()
        : SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
  }
}

Widget circularForButton(double width, {Color color = Colors.white}) {
  return Center(
    // ignore: sized_box_for_whitespace
    child: Container(
      height: width,
      width: width,
      child: CircularProgressIndicator(
        strokeWidth: 2.3,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    ),
  );
}
