import 'package:get/get.dart';
import 'package:getx_demo/controllers/camera/camera_page_controller.dart';
import 'package:getx_demo/controllers/camera/qr_scanner_controller.dart';

class CameraBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CameraPageController>(() => CameraPageController());
    Get.lazyPut<QrScannerController>(() => QrScannerController());
  }

}