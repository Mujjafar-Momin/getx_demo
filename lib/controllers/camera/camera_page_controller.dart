import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/camera_page_binding.dart';
import 'package:getx_demo/screens/camera/qr_scanner_page.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// import 'package:qr_code_scanner/qr_code_scanner.dart';

enum FlashStatus { AUTO, OFF, ON }

class CameraPageController extends GetxController {
  List<CameraDescription> camera = [];
  var isLoading = true.obs;
  var isFlashOn = true.obs;
  late CameraController cameraController;
  int selectedCameraIndex = 0;
  File? clickedFile;
  Directory? appDocumentsDir;
  String storedPath = '';
  var storedSuccessfully = false.obs;

  initCamera() async {
    camera = await availableCameras();
    cameraController = CameraController(camera[selectedCameraIndex], ResolutionPreset.high);
    cameraController.initialize().then((value) {
      update();
    }).catchError((e) {
      log('Camera initialize error $e');
      if (e is CameraException ) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('access denied');
            break;
          default:
            print('disc ${e.description}');
            break;
        }
      }
    });
    isLoading(false);
    update();
  }

  takePicture() async {
    if (!cameraController.value.isInitialized) {
      return;
    }
    if (cameraController.value.isTakingPicture) {
      return;
    }
    try {
      await cameraController.setFlashMode(FlashMode.auto);
      XFile picture = await cameraController.takePicture();
      clickedFile = File(picture.path);
      saveToGallery();
      update();
    } catch (e) {
      log('error in taking picture $e');
    }
  }
  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();

  saveToGallery() async {
    appDocumentsDir = await getApplicationDocumentsDirectory();
    if (appDocumentsDir != null && clickedFile != null) {
      String dirPath ='${ appDocumentsDir!.path}/Pictures/pics';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${timestamp()}.jpg';
      final res = await ImageGallerySaver.saveFile(clickedFile!.path);
      if (res['isSuccess'] == true) {
        storedSuccessfully(true);
        Get.snackbar(
          'Saved to galley',
          'Path ${res['filePath']}',
          backgroundColor: Colors.green,
          snackStyle: SnackStyle.GROUNDED,
          margin: EdgeInsets.zero,
        );
      } else {
        Get.snackbar(
          'Error',
          '${res['errorMessage']}',
          backgroundColor: Colors.red,
          snackStyle: SnackStyle.GROUNDED,
          margin: EdgeInsets.zero,
        );
      }
      print("path==> $res");
    }
  }

  setFlash() async {
    print('object ${isFlashOn.value}');
    print('object ${!isFlashOn.value}');
    isFlashOn.value = !isFlashOn.value;
    update();
    if (isFlashOn.value) {
      await cameraController.setFlashMode(FlashMode.torch);
    } else {
      await cameraController.setFlashMode(FlashMode.off);
    }
  }

  flipCamera() async {
    if (cameraController != null) {
      await cameraController.dispose();
    }
    selectedCameraIndex = (selectedCameraIndex + 1) % camera.length;
    isLoading(true);
    update();
    initCamera();
  }

  navigateToScanner(){
    Get.to(()=>QrScannerPage(),binding: CameraBinding());
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await initCamera();
  }
}
