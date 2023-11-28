import 'package:get/get.dart';
import 'package:getx_demo/controllers/sms_autofill/sms_controller.dart';

class SmsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SmsController>(() => SmsController());
  }
}