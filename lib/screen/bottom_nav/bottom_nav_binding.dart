
import 'package:get/get.dart';

import 'bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => BottomNavController());
   }
}