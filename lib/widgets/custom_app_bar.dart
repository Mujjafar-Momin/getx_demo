import 'package:flutter/material.dart';

import '../themes/app_theme.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.onLeftIconTap}) : super(key: key);
  final VoidCallback onLeftIconTap;
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
          child: const Icon(
            Icons.dashboard_outlined,
            size: 18,
          ),
        ),
        InkWell(
          onTap: (){
            onLeftIconTap.call();
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
