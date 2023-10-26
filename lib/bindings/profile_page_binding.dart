import 'package:get/get.dart';
import 'package:getx_demo/controllers/profile_page_controller.dart';

class ProfilePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}