import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/sms_binding.dart';
import 'package:getx_demo/screens/sms_autofill/otp_page.dart';
import 'package:getx_demo/widgets/country.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsController extends GetxController {
  String appSign = '';
  String otpCode = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listenOTP();
    initNotification();
  }

  void listenOTP() async {
    await SmsAutoFill().listenForCode();
  }

  int i = 0;

  getAppSign() async {
    appSign = await SmsAutoFill().getAppSignature;
    print('app signature $appSign');
    update();
  }

  navigateToOtp() {
    Get.to(() => const OtpPage(), binding: SmsBinding());
  }

  static  final FlutterLocalNotificationsPlugin fltNotificationsPlugin = FlutterLocalNotificationsPlugin();

  initNotification() async {
    print('initNotification');
    try {

        var androidSetting=const AndroidInitializationSettings('app_icon');
        var iosSetting= DarwinInitializationSettings(
            requestAlertPermission: true,
            requestSoundPermission: true,
            requestBadgePermission: true ,
            onDidReceiveLocalNotification: (int id,String? title,String? body,String? payload) async{}
        );

        var initializationSettings =  InitializationSettings(
          android:androidSetting,
          iOS:iosSetting,);

      var res =await fltNotificationsPlugin.initialize(
        initializationSettings,
        // onDidReceiveBackgroundNotificationResponse: (NotificationResponse? response){
        //   print('');
        // },
        onDidReceiveNotificationResponse: notificationReceive,
      );
      print('res ${res}');
    } catch (e) {
      print(e);
    }
  }

  Future showNotification() async {

    var androidDetails = const AndroidNotificationDetails(
      'New Id',
      'New Name',
      channelDescription: 'Channel Description',
      visibility: NotificationVisibility.public,
      importance: Importance.max,
      priority: Priority.high,
      channelAction: AndroidNotificationChannelAction.update,
    );
    var iosDetails = const DarwinNotificationDetails();
    var notificationDetails =  NotificationDetails(android: androidDetails, iOS: iosDetails);

    await fltNotificationsPlugin.show(1, 'title', 'body', notificationDetails,payload: 'payload');
    print('response');
  }

  notificationReceive(NotificationResponse response) {
    print(response);
  }
}
