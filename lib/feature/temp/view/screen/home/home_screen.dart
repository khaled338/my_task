import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/consts/app_colors.dart';
import 'package:my_task_app/core/consts/assets.dart';
import 'package:my_task_app/feature/temp/logic/controller/home/home_controller.dart';
import 'package:my_task_app/feature/temp/view/widgets/home/bannar_slider.dart';
import 'package:my_task_app/feature/temp/view/widgets/home/product_card.dart';
class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController(), permanent: true);
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.secondary,));
        }

        return SafeArea(
          child: Column(
            children: [
              /// ✅ Error Banner لو حصل مشكلة
              if (controller.errorMessage.isNotEmpty)
                Container(
                  width: double.infinity,
                  color: Colors.red.withOpacity(0.1),
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          controller.errorMessage.value,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              /// ✅ باقي الصفحة
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    /// العنوان + اللوجو
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25.w, 25.h, 25.w, 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(Assets.splash, height: 50.h),
                            Text(
                              'اشترك واستمتع',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 28.sp,
                              ),
                            ),
                            Icon(
                              Icons.account_circle_rounded,
                              color: AppColors.textColor,
                              size: 32.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),

                    /// ✅ البانر سلايدر
                    SliverToBoxAdapter(child: BannerSlider(controller: controller)),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                    /// ✅ عنوان المنتجات
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'أحدث المنتجات',
                            style: TextStyle(
                              fontSize: 26.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// ✅ شبكة المنتجات
                    controller.products.isEmpty
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(30.h),
                                child: Text(
                                  "لا توجد بيانات متاحة",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SliverPadding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate((context, index) {
                                final product = controller.products[index];
                                return ProductCard(product: product);
                              }, childCount: controller.products.length),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 12.h,
                                childAspectRatio: 0.75,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
