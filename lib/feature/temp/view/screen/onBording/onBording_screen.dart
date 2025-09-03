import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/consts/app_colors.dart';
import 'package:my_task_app/feature/temp/logic/controller/onBording/onBording_controller.dart';

class onBordingScreen extends StatelessWidget {
  onBordingScreen({super.key});
  final controller = Get.put(OnBordingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // الصفحات
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) => controller.currentPage.value = index,
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  var page = controller.pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(page.image, height: 300.h),
                      SizedBox(height: 30.h),
                      Text(
                        page.title,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // المؤشرات (dots)
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.pages.length,
                    (index) => Container(
                      margin: EdgeInsets.all(5.w),
                      width:
                          controller.currentPage.value == index ? 12.w : 8.w,
                      height:
                          controller.currentPage.value == index ? 12.w : 8.w,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? AppColors.secondary
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )),

            // الأزرار
            Obx(() {
              bool isLast =
                  controller.currentPage.value == controller.pages.length - 1;

              return Padding(
                padding: EdgeInsets.all(20.w),
                child: isLast
                    ? // زرار واحد "Get Started" في آخر صفحة
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.skip(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            "البداية",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      )
                    : // زرارين Skip + Next في الصفحات العادية
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: controller.skip,
                            child: Text(
                              "تخطى",
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 190.w,
                            child: ElevatedButton(
                              onPressed: controller.nextPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                "التالي",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}