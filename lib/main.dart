import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/camera_page_binding.dart';
import 'package:getx_demo/bindings/home_page_binding.dart';
import 'package:getx_demo/screens/camera_page.dart';
import 'package:getx_demo/screens/review_call_page.dart';
import 'package:getx_demo/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      initialBinding: HomePageBinding(),
      getPages:const [
      ],
    );
  }
}
