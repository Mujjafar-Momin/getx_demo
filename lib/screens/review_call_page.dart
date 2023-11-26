import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/profile_page_binding.dart';
import 'package:getx_demo/controllers/home_page_controller.dart';
import 'package:getx_demo/services/location_services.dart';
import 'package:getx_demo/themes/app_theme.dart';
import 'package:getx_demo/widgets/custom_app_bar.dart';

class ReviewCallPage extends StatefulWidget {
  const ReviewCallPage({Key? key}) : super(key: key);

  @override
  State<ReviewCallPage> createState() => _ReviewCallPageState();
}

class _ReviewCallPageState extends State<ReviewCallPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade100,
          body: Column(
            children: [
              CustomAppBar(
                onRightIconTap: () {},
                onLeftIconTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/trading.jpg',
                          width: double.maxFinite,
                          height: context.height * .2,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Watchlist',
                          style: textStyle(weight: FontWeight.w700, size: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(color: greyBoxBack, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: controller.strings
                              .map((e) => Container(
                            child: Text(
                              e,
                              style: textStyle(weight: FontWeight.w500),
                            ),
                          ),
                          )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          ...controller.plans.map(
                                (e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(1, 1),
                                ),
                              ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/Bitcoin.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Ethereum ',
                                              style: textStyle(weight: FontWeight.w500),
                                            ),
                                            Text(
                                              'ETH',
                                              style: textStyle(weight: FontWeight.w500, color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                        Text(
                                          //asdkjbd jasbkasdbk ksbkasdh mksbksadb
                                          '0.1281',
                                          style: textStyle(weight: FontWeight.w400, color: Colors.grey.shade700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$2,481.43',
                                        style: textStyle(weight: FontWeight.w500),
                                      ),
                                      Text(
                                        '+74.54%',
                                        style: textStyle(weight: FontWeight.w400, color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: controller.listofDashBoards,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
