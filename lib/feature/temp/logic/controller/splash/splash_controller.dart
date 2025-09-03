import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("✅ SplashController onInit called");

    // ننتظر لما الصفحة تظهر فعليًا
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("✅ SplashScreen rendered, starting delay...");
      Future.delayed(const Duration(seconds: 3), () {
        print("✅ Navigating to splashTwo...");
        Get.offNamed(AppRoutes.onBoarding);
      });
    });
  }
}