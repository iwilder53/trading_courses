import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../navigation/navigators.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final dW;
  const MyAppBar({super.key, required this.dW});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: dW * 0.2,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: dW * 0.16,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: dW * 0.035),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/bookmark.svg',
              color: Colors.black,
            ),
          ),
        )
      ],
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset('assets/svg/back_arrow.svg'),
      ),
    );
  }
}
