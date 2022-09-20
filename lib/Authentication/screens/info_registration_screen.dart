import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/navigation/navigators.dart';
import 'package:intl/intl.dart';

import '../../../Authentication/models/user.dart';
import '../../home_screen/screens/home_screen.dart';
import '../widgets/gender_radio_buttons.dart';

class InfoRegistrationScreen extends StatefulWidget {
  const InfoRegistrationScreen({super.key});

  @override
  State<InfoRegistrationScreen> createState() => _InfoRegistrationScreenState();
}

class _InfoRegistrationScreenState extends State<InfoRegistrationScreen> {
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
    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;

    int _id = 2;
    void genderSelected(int? id) {
      print('clicked');
      setState(() {
        _id = id!;
      });
    }

    return Scaffold(
        body: Stack(children: [
      ListView(padding: EdgeInsets.all(18), children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: display_height * 0.05,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(0),
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      pop(context);
                    },
                  ),
                  /*     SizedBox(
              width: display_width / 1.8,
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
                  padding:
                      EdgeInsets.only(top: 40, bottom: display_height * 0.02),
                  child: SvgPicture.asset('assets/svg/profile_details.svg')),
              Container(
                  // alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child:
                      const Text('Please enter the details below to continue',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ))),
              SizedBox(
                height: display_height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: display_height * 0.02),
                width: display_width * 0.9,
                child: TextField(
                  controller: nameInput,
                  decoration: InputDecoration(
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
                margin: EdgeInsets.symmetric(vertical: display_height * 0.02),
                width: display_width,
                child: Form(
                  child: TextFormField(
                    key: _mailFormKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please provide a valid email address';
                      }
                    },
                    controller: mailInput,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
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
                width: display_width * 0.9,
                child: TextField(
                  controller: dateInput,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow('/'),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                    label: Text(
                      'Birth Date',
                      style: TextStyle(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: formattedDate,
                    contentPadding: EdgeInsets.only(top: 8),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      formattedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);
                      print(dateInput.text);

                      print(formattedDate);

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
              RadioGroup() /* Row(
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
      ]),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            width: display_width,
            height: display_height * 0.07,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            margin: EdgeInsets.only(bottom: display_height * 0.1),
            child: ElevatedButton(
              onPressed: () {
                print('valid email');

                Provider.of<User>(context, listen: false).register(
                    mailInput.text.toString(),
                    nameInput.text.toString(),
                    dateInput.text.toString(),
                    RadioGroupWidget().genders[RadioGroupWidget().id]);

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
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
