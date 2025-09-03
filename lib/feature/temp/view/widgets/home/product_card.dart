import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/consts/app_colors.dart';
import 'package:my_task_app/feature/temp/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ✅ تقدر تروح لصفحة تفاصيل المنتج هنا
        // Get.to(() => ProductDetailsPage(productId: product.id));
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🖼 صورة المنتج + القلب
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: product.cachedImage != null
                        ? Image.memory(
                            base64Decode(product.cachedImage!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : CachedNetworkImage(
                            imageUrl: product.image,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.secondary),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.broken_image,
                              size: 50.sp,
                              color: Colors.grey,
                            ),
                          ),
                  ),

                  /// ❤️ أيقونة المفضلة
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Obx(
                      () => InkWell(
                        onTap: () => product.isFavorite.toggle(),
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            product.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.isFavorite.value
                                ? Colors.red
                                : Colors.grey,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),

            /// 📝 اسم المنتج
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),

            SizedBox(height: 4.h),

            /// 💲 السعر + زر الإضافة
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ✅ الأسعار فوق بعض
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.sale_price > 0) ...[
                      Text(
                        "${product.regular_price} \$",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                          decorationThickness: 2,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "${product.sale_price} \$",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ] else
                      Text(
                        "${product.regular_price} \$",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),

                const Spacer(),

                /// ✅ زر الإضافة
                InkWell(
                  onTap: () {
                    // إضافة المنتج للسلة
                  },
                  borderRadius: BorderRadius.circular(30.r),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "إضافة",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}