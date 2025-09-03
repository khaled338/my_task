import 'package:get/get.dart';
import 'package:my_task_app/feature/temp/logic/controller/onBording/onBording_controller.dart';

class OnBordingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBordingController());
  }
}