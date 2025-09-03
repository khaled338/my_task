import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task_app/core/routes/app_pages.dart';
import 'package:my_task_app/core/themes/font_theme.dart' as AppTheme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
     
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SizeConfig.init(context);
    return ScreenUtilInit(
      enableScaleWH: () => false,
      enableScaleText: () => false,
       designSize: const Size(432, 336),
      builder: (context, child) => GetMaterialApp(
        title: 'kadymartApp',
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
       // initialBinding: HomeBinding(),
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}