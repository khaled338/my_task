import 'package:get/get.dart';
import 'package:my_task_app/feature/temp/logic/controller/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}