import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/sms_binding.dart';
import 'package:getx_demo/screens/sms_autofill/otp_page.dart';
import 'package:getx_demo/widgets/country.dart';
import 'package:sms_autofill/sms_autofill.dart';


class SmsController extends GetxController{
 String appSign='';
 String otpCode='';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listenOTP();

  }

 void listenOTP()async{
    await SmsAutoFill().listenForCode();
 }

 int i=0;


  getAppSign()async{
    appSign= await SmsAutoFill().getAppSignature;
    print('app signature $appSign');
    update();
  }
 navigateToOtp(){
    Get.to(()=>const OtpPage(),binding: SmsBinding());
 }
}