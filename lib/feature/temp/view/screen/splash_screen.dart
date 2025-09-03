import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/consts/app_colors.dart';
import 'package:my_task_app/core/consts/assets.dart';
import 'package:my_task_app/feature/temp/logic/controller/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Stack(
              children: [
                // Positioned(
                //   top: 20.h,
                //   left: 0,
                //   right: 0,
                //   child: Image.asset(
                //     Assets.waveSplashScreen,
                //     fit: BoxFit.cover,
                //     width: 1.sw, // عرض كامل للشاشة
                //   ),
                // ),
                Center(
                  child: Image.asset(
                    Assets.splash,
                    width: 150.w,
                    height: 150.w, // استخدام نفس القيمة للعرض والارتفاع للحفاظ على التناسب
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}