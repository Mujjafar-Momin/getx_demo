import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/camera_page_controller.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraPageController>(
      builder: (controller) {
        return controller.isLoading.value
            ? Container()
            : Scaffold(
                body: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      child: CameraPreview(controller.cameraController),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.black87,
                            height: context.height * .1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: ()=>controller.setFlash(),
                                  icon:  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child:controller.isFlashOn.value ?const Icon(
                                      Icons.flash_on,
                                      color: Colors.white,
                                    ): const Icon(
                                      Icons.flash_off_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Icon(
                                      Icons.qr_code_scanner_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.black87,
                            height: context.height * .15,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      shape: BoxShape.circle,
                                    ),
                                    child: controller.file != null
                                        ? ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            child: Image.file(
                                              controller.file!,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : const Text(''),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async => controller.takePicture(),
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.symmetric(
                                        vertical: BorderSide(color: Colors.grey, width: 4),
                                        horizontal: BorderSide(color: Colors.grey, width: 4),
                                      ),
                                    ),
                                    child: const Text(''),
                                  ),
                                ),
                                InkWell(
                                  onTap: ()=>controller.flipCamera(),
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.flip_camera_android,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
