import 'package:flutter/material.dart';

import '../themes/app_theme.dart';


class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key,
    required this.onRightIconTap,
    this.rightIconWidget,
    required this.onLeftIconTap,
    this.leftIconWidget}) : super(key: key);

  final VoidCallback onRightIconTap;
  final VoidCallback onLeftIconTap;
  Widget? rightIconWidget;
  Widget? leftIconWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: greyBoxBack,
            borderRadius: BorderRadius.circular(10),
          ),
          child:rightIconWidget?? const Icon(
            Icons.dashboard_outlined,
            size: 18,
          ),
        ),
        InkWell(
          onTap: (){
            onRightIconTap.call();
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: pinkBoxBack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/icons/ic_profile.png',
              height: 20,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }
}
