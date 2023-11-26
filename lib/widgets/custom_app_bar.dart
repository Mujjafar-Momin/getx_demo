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
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color:  Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child:rightIconWidget?? const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 18,
            ),
          ),
          Text('Palladium',style: textStyle(weight: FontWeight.w700,size: 20),),
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
      ),
    );
  }
}
