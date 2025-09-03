import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/cache/cache_helper.dart';
import '../services/cache/cache_keys.dart';

//Getx Controller that's responsible for changing the language and for the start of the app it will have the default
//Device Language
class LanguageController extends GetxController {
  late Rxn<Locale> currentLanguage = Rxn<Locale>(
    Locale(CacheHelper.getData(CacheKeys.languageCode) ??
        Get.deviceLocale!.languageCode ??
        'en'),
  );

  void toggleLanguage() {
    currentLanguage.value = currentLanguage.value!.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    Get.updateLocale(currentLanguage.value!);
  }

  void changeLanguage(String languageCode) {
    currentLanguage.value = Locale(languageCode);
    CacheHelper.setData(CacheKeys.languageCode, languageCode);
    Get.updateLocale(currentLanguage.value!);
    print('Language Changed to ${CacheHelper.getData(CacheKeys.languageCode)}');
  }

  Locale getCacheLanguage() {
    Locale locale = Locale(CacheHelper.getData(CacheKeys.languageCode) ??
        currentLanguage.value!.languageCode);
    return locale;
  }

  Rxn<Color> primColor = Rxn<Color>(Colors.white);
}
