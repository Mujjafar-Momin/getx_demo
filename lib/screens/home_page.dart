import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/home_page_controller.dart';
import 'package:getx_demo/themes/app_theme.dart';
import 'package:getx_demo/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: CustomAppBar(),
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hi,Sophie',
                                style: textStyle(size: 24, weight: FontWeight.w600, letterSpace: 2),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset('assets/svgImages/wavehand.svg', height: 26),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: greyBoxBack),
                                  child: TextFormField(
                                    decoration:
                                        const InputDecoration(hintText: 'Search', enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, prefixIcon: Icon(Icons.search)),
                                    cursorHeight: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.sort,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Featured Categories',
                              style: textStyle(weight: FontWeight.w500, size: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...controller.list
                                  .map((e) => Column(
                                        children: [
                                          Container(
                                            height: 70,
                                            margin: const EdgeInsets.symmetric(horizontal: 8),
                                            width: 70,
                                            decoration: const BoxDecoration(color: greyBoxBack, borderRadius: BorderRadius.all(Radius.circular(35))),
                                            child: e.$1,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            e.$2,
                                            style: textStyle(
                                              size: 12,
                                            ),
                                          )
                                        ],
                                      ))
                                  .toList(),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Today plan',
                              style: textStyle(weight: FontWeight.w500, size: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: 4,
                              separatorBuilder: (context, index) => Container(
                                height: 10,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: Image.asset('assets/images/img_man.jpg'),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '5 Km running',
                                              style: textStyle(weight: FontWeight.w500),
                                            ),
                                            Text(
                                              '42 minutes',
                                              style: textStyle(weight: FontWeight.w400, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: controller.listofDashBoards,
                        ),
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }

}
