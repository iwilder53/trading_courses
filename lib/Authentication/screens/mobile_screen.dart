import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_courses/navigation/arguments.dart';
import '../../../navigation/navigators.dart';
import '../../../navigation/routes.dart';
import '../widgets/divider_line.dart';
import '../widgets/footer.dart';
import '../widgets/other_login_options.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumController = TextEditingController();

    final display_size = MediaQuery.of(context).size;
    final display_width = display_size.width;
    final display_height = display_size.height;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: display_height * 0.02),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: display_height * 0.1,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: SvgPicture.asset('assets/svg/mobile_login_icon.svg')),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 10),
                child: const Text(
                  'Mobile Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )),
            Container(
                margin: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: const Text(
                  'Enter your number to proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                )),
            Container(
              width: display_width,
              child: Row(
                children: [
                  // SizedBox(width: display_width * 0.3),
                  /*   const Icon(
                    Icons.phone_android_outlined,
                  ), */
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.all(0),
                    width: display_width * 0.9,
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.characters.length != 10) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                            controller: phoneNumController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone_android_outlined),
                                hintText: 'Enter your mobile number',
                                contentPadding: EdgeInsets.only(top: 18)),
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              //  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: display_width,
                            height: display_height * 0.06,
                            //  padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  push(context, NamedRoute.otpScreen,
                                      arguments: OtpScreenArguments(
                                          mobNumber:
                                              phoneNumController.text.trim()));
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpScreen(MobNumber: phoneNumController.text) ));
                                }
                              },
                              child: Text("GET OTP"),
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
            HorizontalOrLine(label: 'OR', height: 10),
            OtherLoginOptions(),
            Footer()
          ],
        ),
      ),
    );
  }
}
