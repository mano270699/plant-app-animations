import 'package:animated_plant_ui/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
