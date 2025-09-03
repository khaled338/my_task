import 'package:get/get.dart';
import 'package:my_task_app/feature/temp/logic/controller/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}