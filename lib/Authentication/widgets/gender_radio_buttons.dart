// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/Authentication/providers/auth_provider.dart';

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

  // Group Value for Radio Button.
  int _id = 1;
  void genderSelected(int? val) {
    setState(() {
      _id = val!;
      Provider.of<AuthProvider>(context, listen: false).user.gender =
          genders[_id - 1];
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).user.gender = 'male';
  }

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;

    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 1,
          groupValue: _id,
          onChanged: (val) {
            genderSelected(val);
            print('val$val');
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
          groupValue: _id,
          onChanged: (val) {
            genderSelected(val);
            print('val$val');

            id = 2;
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
          groupValue: _id,
          onChanged: (val) {
            id = 3;
            genderSelected(val);
            print('val$val');
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
