import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'app/routes/theme_app_pages.dart';
import 'common/color_manager.dart';
import 'common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.scaffoldBackground, // Set the status bar color
    statusBarIconBrightness:
        Brightness.dark, // Set the color of status bar icons
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: 'Tasks Management',
              onReady: () async {},
              getPages: ThemeAppPages.routes,
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.cupertino,
              theme: AppTheme.themeData);
        });
  }
}
