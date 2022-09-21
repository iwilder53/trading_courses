// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({super.key});

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {
  // Default Radio Button Item
  String radioItem = 'None';
  List<String> genders = ['male', 'female', 'other'];
  // Group Value for Radio Button.
  int id = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;

    // Default Radio Button Selected Item When App Starts.

    // Group Value for Radio Button.
    int _id = 1;
    void genderSelected(int? id) {
      setState(() {
        // _id = id!;
      });
    }

    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 1,
          groupValue: id,
          onChanged: (val) {
            genderSelected(val);
            id = 1;
          },
        ),
        const Text(
          'Male',
          style: TextStyle(fontSize: 16.0),
        ),
        Radio(
          value: 2,
          toggleable: true,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              id = 2;
            });
          },
        ),
        const Text(
          'Female',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Radio(
          value: 3,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              id = 3;
            });
          },
        ),
        const Text(
          'Other',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
