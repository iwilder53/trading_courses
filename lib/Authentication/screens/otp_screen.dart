import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trading_courses/navigation/arguments.dart';
import 'package:trading_courses/navigation/routes.dart';

import '../../../navigation/navigators.dart';
import '../widgets/footer.dart';

class OtpScreen extends StatelessWidget {
  final OtpScreenArguments args;

   OtpScreen({
    super.key,
    required this.args,
  });
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TextEditingController otpController = TextEditingController();
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final dH = dS.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: dH * 0.12,
          ),
          Container(
              margin: EdgeInsets.only(top: dH * 0.1),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset('assets/svg/mobile_login_icon.svg')),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20, bottom: 5, left: 10),
              child: const Text(
                'Mobile Verification',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Enter your the six digit number sent to ${args.mobNumber} ',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )),
          SizedBox(
            width: dW,
            child: Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,

                    length: 6,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v == null || v.characters.length != 6) {
                        return "Enter 6 digits";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                    textStyle: const TextStyle(fontSize: 20, height: 1.6),
                    // backgroundColor: Colors.blue.shade50,
                    // enableActiveFill: true,
                    //  errorAnimationController: errorController,
                    // controller: textEditingController,
                    keyboardType: TextInputType.number,

                    onCompleted: (v) {
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
          ),
          Container(
            width: dW,
            height: dH * 0.06,
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  push(context, NamedRoute.photoScreen);
                }

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MobileScreen() ) );
              },
              child: const Text("Continue"),
            ),
          ),
          SizedBox(
            height: dH * 0.16,
          ),
          const Footer(),
        ],
      ),
    );
  }
}
