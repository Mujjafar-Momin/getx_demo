import 'package:get/get.dart';
import 'package:getx_demo/controllers/camera_page_controller.dart';

class CameraPageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CameraPageController>(() => CameraPageController());
  }
}