import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../services/location_services.dart';

class HomePageController extends GetxController{
  bool isLoading = true;

  List<(Widget, String)> list = [
  (const Icon(Icons.emoji_emotions), "Yoga"),
  (const Icon(Icons.emoji_objects_outlined), 'Gym'),
  (const Icon(Icons.emoji_events), 'Events'),
  (const Icon(Icons.emoji_food_beverage_outlined), 'Run'),
  ];

  List<Widget>listofDashBoards=[
    IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined,color: Colors.white,),),
    IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month_outlined,color: Colors.white,),),
    IconButton(onPressed: () {}, icon: const Icon(Icons.blur_circular_outlined,color: Colors.white,),),
    IconButton(onPressed: () {}, icon: const Icon(Icons.settings,color: Colors.white,),),
  ];
  var plans =[1,2,3,4,5,6];

  var lat,log;
  LocationData? loc;
  void locationInit() async{
    loc=await LocationServices.instance.getLocationData();
    if(loc!=null){
      debugPrint('lat ${loc!.latitude}');
      debugPrint('longitude ${loc!.longitude}');
      debugPrint('accuracy ${loc!.accuracy}');
    }
  }
}