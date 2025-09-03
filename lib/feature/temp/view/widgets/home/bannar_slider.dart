
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_task_app/feature/temp/logic/controller/home/home_controller.dart';

class BannerSlider extends StatelessWidget {
   final HomeController controller;  // نستخدم اللي جاي من برّه

  const BannerSlider({super.key, required this.controller});  // صح كده


//  const BannerSlider({super.key, required this.controller});  // صح كده

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: PageView.builder(
        key: UniqueKey(),
        controller: controller.bannerPageController,
        itemCount: controller.banners.length,
        onPageChanged: (index) => controller.currentBannerIndex.value = index,
        itemBuilder: (context, index) {
          final banner = controller.banners[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                children: [
                  Image.asset(
                    banner.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ],
                        begin: Alignment.centerLeft,
                        //end: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.w,
                    top: 20.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          banner.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          banner.subtitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ElevatedButton(
                          onPressed: () {
                            // تنفيذ الطلب
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Text(
                            "تسوق الان",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}