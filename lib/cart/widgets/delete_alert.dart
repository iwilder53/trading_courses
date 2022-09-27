import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_screen/models/course_model.dart';
import '../Provider/cart_provider.dart';

showAlertDialog(BuildContext context, Course courseTochange) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "Cancel",
      style: Theme.of(context).textTheme.button!.copyWith(
          fontFamily: 'Montserrat',
          fontSize: 12,
          color: const Color(0xff737373),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.clip),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget continueButton = ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xff3199D8),
      ),
    ),
    child: Text(
      "Confirm",
      style: Theme.of(context).textTheme.button!.copyWith(
          fontFamily: 'Montserrat',
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.clip),
    ),
    onPressed: () {
      Provider.of<CartProvider>(context, listen: false)
          .removeCourse(courseTochange);
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0))),
    title: Text(
      "Remove Item",
      style: Theme.of(context).textTheme.button!.copyWith(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.clip),
    ),
    content: const Text("Are you sure you want to remove this item  ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
