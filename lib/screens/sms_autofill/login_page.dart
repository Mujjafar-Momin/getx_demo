import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/sms_autofill/sms_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Login Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('App Signature:'),
                Text('${controller.appSign}'),
                const SizedBox(height: 100,),
                ElevatedButton(
                  onPressed: () =>controller.getAppSign(),
                  child: const Text("Get App signature"),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: ()=>controller.navigateToOtp(),
                  child: const Text("Login/Send OTP"),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
