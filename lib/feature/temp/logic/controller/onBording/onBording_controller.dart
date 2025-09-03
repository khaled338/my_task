import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/consts/assets.dart';class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
 class OnBordingController extends GetxController {
 
  var currentPage = 0.obs;
  PageController pageController = PageController();

  List<OnboardingModel> pages = [
  OnboardingModel(
    image: Assets.onBoarding1,
    title: "احصل على المنتجات المفضلة",
    description: "اختر موقعك لتشاهد تشكيلة واسعة من المتاجر وتطلب المنتج الذي تريده",
  ),
  OnboardingModel(
    image: Assets.onBoarding2,
    title: "توصيل سريع",
    description: "نقوم بتوصيل طلبك بسرعة إلى موقعك من خلال تطبيقنا",
  ),
  OnboardingModel(
    image: Assets.onBoarding5,
    title: "دفع سهل",
    description: "طرق دفع متعددة لتوفير الراحة لك",
  ),
];

  void nextPage() {
    if (currentPage.value == pages.length - 1) {
      // آخر صفحة → روح للصفحة الرئيسية
      Get.offAllNamed("/home");
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  void skip() {
    Get.offAllNamed("home");
  }
}
