import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_courses/navigation/arguments.dart';
import '../../../navigation/navigators.dart';
import '../../../navigation/routes.dart';
import '../widgets/divider_line.dart';
import '../widgets/footer.dart';
import '../widgets/other_login_options.dart';

// ignore: must_be_immutable
class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});

  TextEditingController phoneNumController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: dH * 0.02),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: dH * 0.1,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset('assets/svg/mobile_login_icon.svg')),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Mobile Number',
                  textAlign: TextAlign.start,
                  // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Enter your number to proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                )),
            SizedBox(
              width: dW,
              child: Row(
                children: [
                  // SizedBox(width: dW * 0.3),
                  /*   const Icon(
                    Icons.phone_android_outlined,
                  ), */
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.all(0),
                    width: dW * 0.9,
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
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Icon(Icons.phone_android_outlined)),
                                hintText: 'Enter your mobile number',
                                contentPadding: EdgeInsets.only(top: 18)),
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              //  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: dW,
                            height: dH * 0.06,
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
                              child: const Text("GET OTP"),
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
            const HorizontalOrLine(label: 'OR', height: 10),
            const OtherLoginOptions(),
            const Footer()
          ],
        ),
      ),
    );
  }
}
