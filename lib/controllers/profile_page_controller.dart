import 'package:get/get.dart';


class ProfilePageController extends GetxController{
int selectedIndex=0;

void selectEvent(value){
  selectedIndex=value;
  update();
}
}