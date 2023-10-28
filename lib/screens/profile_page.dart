import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/profile_page_controller.dart';
import 'package:getx_demo/themes/app_theme.dart';
import 'package:getx_demo/widgets/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: context.height * .5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: pinkBackGround,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomAppBar(
                              onRightIconTap: () {},
                              onLeftIconTap: () {},
                            ),
                            CircleAvatar(
                              maxRadius: 35,
                              minRadius: 20,
                              child: Image.asset('assets/icons/ic_profile.png'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text("Sophie Wilson", style: textStyle(size: 24, weight: FontWeight.w500)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "23 year old,Female",
                              style: textStyle(weight: FontWeight.w400, size: 12),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: 240,
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)), color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => controller.selectEvent(0),
                                    child: Container(
                                      height: 50,
                                      width: 120,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(25)), color: controller.selectedIndex == 0 ? Colors.black : Colors.white),
                                      child: Text(
                                        'Daily',
                                        style: textStyle(size: 12, color: controller.selectedIndex == 0 ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => controller.selectEvent(1),
                                    child: Container(
                                      height: 50,
                                      width: 120,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(25)), color: controller.selectedIndex == 1 ? Colors.black : Colors.white),
                                      child: Text(
                                        'Weekly',
                                        style: textStyle(size: 12, color: controller.selectedIndex == 1 ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 34),
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: Colors.redAccent),
                      height: context.height * .5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your activity",
                                style: textStyle(color: Colors.white, size: 24, weight: FontWeight.w500),
                              ),
                              const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: context.height * .2,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FractionallySizedBox(
                                          heightFactor: 5 / 10,
                                          child: Container(
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white30,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Text(''),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${controller.date}',
                                      style: textStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: context.height * .2,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FractionallySizedBox(
                                          heightFactor: 7 / 10,
                                          child: Container(
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white30,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Text(''),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${controller.date}',
                                      style: textStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: context.height * .2,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FractionallySizedBox(
                                          heightFactor: 9 / 10,
                                          child: Container(
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Text(''),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${controller.date}',
                                      style: textStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: context.height * .2,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FractionallySizedBox(
                                          heightFactor: 8 / 10,
                                          child: Container(
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white30,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Text(''),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${controller.date}',
                                      style: textStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: context.height * .2,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FractionallySizedBox(
                                          heightFactor: 7 / 10,
                                          child: Container(
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white30,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Text(''),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${controller.date}',
                                      style: textStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "280",
                                    style: textStyle(size: 24, color: Colors.white, weight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Calories",
                                    style: textStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "00:42",
                                    style: textStyle(size: 24, color: Colors.white, weight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Times",
                                    style: textStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1.2",
                                    style: textStyle(size: 24, color: Colors.white, weight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Kilometres",
                                    style: textStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: context.height * .23,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 34),
                      child: Text(
                        '---------------------------------',
                        style: textStyle(color: Colors.white, letterSpace: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
