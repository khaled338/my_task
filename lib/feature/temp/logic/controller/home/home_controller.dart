import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/consts/assets.dart';
import 'package:my_task_app/feature/temp/data/model/product_model.dart';
import 'package:my_task_app/feature/temp/data/repo/product_repo.dart';

class HomeController extends GetxController {
  // 📊 البانرات
  final RxInt currentBannerIndex = 0.obs;
  late PageController bannerPageController = PageController();
  Timer? _timer;
   var errorMessage = ''.obs;
  // ⏳ حالة التحميل
  var isLoading = false.obs;

  // 🛍 المنتجات
  var products = <Product>[].obs;
  final ProductsRepository repository = ProductsRepository();

  // 📢 البانرات الثابتة
  final List<BannerModel> banners = [
    BannerModel(
      imageUrl: Assets.productBannar1,
      title: "سماعات",
      subtitle: "احصل على المزيد من الاستماع الذكي",
    ),
    BannerModel(
      imageUrl: Assets.productBannar2,
      title: "ساعة ذكية",
      subtitle: "تجمع بين الاناقة والوظائف الذكية",
    ),
    BannerModel(
      imageUrl: Assets.productBannar3,
      title: "خصومات",
      subtitle: "احصل على افضل سعر للمنتجات",
    ),
  ];

  // 🚀 Lifecycle
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    bannerPageController = PageController();

    // ✅ تشغيل البانر اوتوماتيك
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
  if (bannerPageController.hasClients) {
    int nextPage = currentBannerIndex.value + 1;
    if (nextPage >= banners.length) nextPage = 0;
    bannerPageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    currentBannerIndex.value = nextPage;
  }
});
  }

  // 🛒 جلب المنتجات (أونلاين + كاش)
  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var result = await repository.fetchProducts();
      products.assignAll(result);
    } catch (e) {
      Get.snackbar(
        "خطأ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // ❤️ إضافة/إزالة من المفضلة
  void toggleFavorite(Product product) {
    product.isFavorite.toggle();
    // ممكن تحفظ IDs المفضلة في الكاش لو محتاج تحافظ عليها بعد إغلاق التطبيق
  }

  @override
  void onClose() {
    _timer?.cancel();
    bannerPageController.dispose();
    super.onClose();
  }
}
class BannerModel {
  final String imageUrl;
  final String title;
  final String subtitle;

  BannerModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}
