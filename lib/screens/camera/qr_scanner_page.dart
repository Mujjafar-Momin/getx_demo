import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/camera/qr_scanner_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends StatelessWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrScannerController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: Stack(
            children: [
              QRView(
                key: controller.qrKey,
                onQRViewCreated: controller.onQRViewCreated,
              ),
              Column(
                children: [
                  Flexible(
                    flex: 9,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: QrScannerOverlayShape(
                          borderColor: Colors.red,
                          borderRadius: 10,
                          borderWidth: 5,
                        ),
                      ),
                      child: const Text(''),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.image,color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
