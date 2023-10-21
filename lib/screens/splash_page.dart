import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/home_page_binding.dart';
import 'package:getx_demo/screens/home_page.dart';


class SpalshPage extends StatefulWidget {
  const SpalshPage({Key? key}) : super(key: key);

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.offAll(HomePage(),binding: HomePageBinding(),);
          },
          child: Text("Home"),
        ),
      ),
    );
  }
}
