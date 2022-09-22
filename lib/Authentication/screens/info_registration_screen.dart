import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/navigation/navigators.dart';
import 'package:intl/intl.dart';

import '../../../Authentication/models/user.dart';
import '../../home_screen/screens/home_screen.dart';
import '../widgets/gender_radio_buttons.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreen();
}

class _PersonalInformationScreen extends State<PersonalInformationScreen> {
  String formattedDate = 'dd/mm/yyyy';
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController mailInput = TextEditingController();
  final _mailFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void setDate() {
    dateInput.text = formattedDate; //set the initial value of text field

    setState(() {
      dateInput.text = formattedDate; //set the initial value of text field
    });
  }

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;

    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    int _id = 2;
    // ignore: unused_element
    void genderSelected(int? id) {
      if (kDebugMode) {
        print('clicked');
      }
      setState(() {
        _id = id!;
      });
    }

    return Scaffold(
        body: ListView(padding: const EdgeInsets.all(18), children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: dH * 0.05,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    pop(context);
                  },
                ),
                /*     SizedBox(
              width: dW / 1.8,
            ), */
                const Text(
                  'Step 2 of 2',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff737373)),
                ),
              ],
            ),
            Container(
                //  alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 40, bottom: dH * 0.02),
                child: SvgPicture.asset('assets/svg/profile_details.svg')),
            Container(
                // alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text('Please enter the details below to continue',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ))),
            SizedBox(
              height: dH * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: dH * 0.02),
              width: dW * 0.9,
              child: TextField(
                controller: nameInput,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    label: Text(
                      'Name',
                      style: TextStyle(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                    // prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: 'Enter your full name here',
                    contentPadding: EdgeInsets.symmetric(vertical: 5)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: dH * 0.02),
              width: dW,
              child: Form(
                child: TextFormField(
                  key: _mailFormKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Please provide a valid email address';
                    }
                    return null;
                  },
                  controller: mailInput,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    label: Text(
                      'Email Address',
                      style: TextStyle(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter your email address here',
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: dW * 0.9,
              child: TextField(
                controller: dateInput,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow('/'),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  label: const Text(
                    'Birth Date',
                    style: TextStyle(color: Colors.black),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: formattedDate,
                  contentPadding: const EdgeInsets.only(top: 8),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

                    dateInput.text = formattedDate;
                    setDate();
                  } else {}
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Gender ',
              ),
            ),
            const RadioGroup() /* Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _id,
                onChanged: (val) {
                  genderSelected(val);
                  print('clicked');
                  _id = 1;
                },
              ),
              Text(
                'Male',
                style: new TextStyle(fontSize: 16.0),
              ),
              Radio(
                value: 2,
                toggleable: true,
                groupValue: _id,
                onChanged: (val) {
                  setState(() {
                    _id = 2;
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
                groupValue: _id,
                onChanged: (val) {
                  setState(() {
                    _id = 3;
                  });
                },
              ),
              Text(
                'Other',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          ), */
          ]),
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            width: dW,
            height: dW * 0.12,
            margin: EdgeInsets.only(top: dW * 0.08),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<User>(context, listen: false).register(
                    mailInput.text.toString(),
                    nameInput.text.toString(),
                    dateInput.text.toString(),
                    RadioGroupWidget().genders[RadioGroupWidget().id]);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            )),
      ),
    ]));
  }
}
