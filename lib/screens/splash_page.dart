import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/camera_page_binding.dart';
import 'package:getx_demo/bindings/home_page_binding.dart';
import 'package:getx_demo/screens/camera_page.dart';
import 'package:getx_demo/screens/home_page.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.offAll(const CameraPage(),binding: CameraPageBinding(),);
          },
          child: const Text("Go to Camera"),
        ),
      ),
    );
  }
}
