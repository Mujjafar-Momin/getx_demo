import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/sms_autofill/sms_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'OTP Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter OTP:',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  PinFieldAutoFill(
                    onCodeChanged: (val) {
                      print(val);
                    },
                    codeLength: 4,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
