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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: dH * 0.12,
            ),
            Padding(
              padding: EdgeInsets.all(dW * 0.05),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: dH * 0.1),
                      alignment: Alignment.centerLeft,
                      //  padding: const EdgeInsets.only(left: 10),
                      child:
                          SvgPicture.asset('assets/svg/mobile_login_icon.svg')),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 5,
                      ),
                      child: const Text(
                        'Mobile Verification',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      //  padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Enter your the six digit number sent to\n${args.mobNumber} ',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: dW,
              child: Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: dW * 0.05, vertical: dW * 0.05),
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
                        activeFillColor: Colors.black12,
                        inactiveColor: Colors.black,
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldWidth: dW * 0.1,
                        fieldHeight: dH * 0.06,
                      ),
                      textStyle: const TextStyle(fontSize: 20, height: 1.6),
                      // backgroundColor: Colors.blue.shade50,
                      // enableActiveFill: true,
                      //  errorAnimationController: errorController,
                      // controller: textEditingController,
                      keyboardType: TextInputType.number,

                      onCompleted: (v) {
                        if (_formKey.currentState!.validate()) {
                          push(context, NamedRoute.photoScreen);
                        }
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {},
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
      ),
    );
  }
}
