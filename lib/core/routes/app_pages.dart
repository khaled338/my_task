
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_task_app/core/routes/app_routes.dart';
import 'package:my_task_app/feature/temp/logic/binding/home/home_binding.dart';

import 'package:my_task_app/feature/temp/logic/binding/onBording/onBording_binding.dart';
import 'package:my_task_app/feature/temp/logic/binding/splash/splash_binding.dart';
import 'package:my_task_app/feature/temp/view/screen/home/home_screen.dart';
import 'package:my_task_app/feature/temp/view/screen/onBording/onBording_screen.dart';

import 'package:my_task_app/feature/temp/view/screen/splash_screen.dart';
class AppPages {
  static const initial = '/splash';
  static const onboarding = '/onboarding'; 
  static const passcode = '/passcode';
  static const homePage = '/homePage';

  static final routes = [
  
  
GetPage(
  name: AppRoutes.initial,
  page: () => SplashScreen(),
  binding: SplashBinding(),
),
GetPage(
  name: AppRoutes.onBoarding,
  page: () => onBordingScreen(),
  binding: OnBordingBinding(),
),
GetPage(
  name: AppRoutes.home,
  page: () => HomeScreen(),
  binding: HomeBinding(),
),




// GetPage(
//       name: '/onboarding',
//       page: () => OnboardingView(),
//       binding: OnboardingBinding(), // تأكد من ربط الـ Binding هنا
//     ),
    
  ];
}
