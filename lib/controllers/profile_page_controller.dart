import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ProfilePageController extends GetxController{
int selectedIndex=0;
var date=DateFormat('MMM d').format(DateTime.now());
void selectEvent(value){
  selectedIndex=value;
  update();
}
}