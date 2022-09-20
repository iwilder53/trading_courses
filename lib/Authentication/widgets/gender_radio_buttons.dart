import 'dart:ffi';

import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
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
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;

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
            print('clicked');
            id = 1;
          },
        ),
        Text( 
          'Male',
          style: new TextStyle(fontSize: 16.0),
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
        Text(
          'Female',
          style: new TextStyle(
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
        Text(
          'Other',
          style: new TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
