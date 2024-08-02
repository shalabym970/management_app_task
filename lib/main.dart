import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'app/routes/theme_app_pages.dart';
import 'common/color_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.white, // Set the status bar color
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
              theme: ThemeData(
                  primaryColor: AppColors.black,

                  scaffoldBackgroundColor: AppColors.scaffoldBackground,
                  inputDecorationTheme: InputDecorationTheme(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors
                                .black), // Color of the underline when focused
                      ),
                      labelStyle: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          height: 2)),
                  textTheme: const TextTheme(
                    displayLarge: TextStyle(color: AppColors.textColor),
                    displayMedium: TextStyle(color: AppColors.textColor),
                    displaySmall: TextStyle(color: AppColors.textColor),
                    headlineLarge: TextStyle(color: AppColors.textColor),
                    headlineMedium: TextStyle(color: AppColors.textColor),
                    headlineSmall: TextStyle(color: AppColors.textColor),
                    titleLarge: TextStyle(color: AppColors.textColor),
                    titleMedium: TextStyle(color: AppColors.textColor),
                    titleSmall: TextStyle(color: AppColors.textColor),
                    bodyLarge: TextStyle(color: AppColors.textColor),
                    bodyMedium: TextStyle(color: AppColors.textColor),
                    bodySmall: TextStyle(color: AppColors.textColor),
                    labelLarge: TextStyle(color: AppColors.textColor),
                    labelMedium: TextStyle(color: AppColors.textColor),
                    labelSmall: TextStyle(color: AppColors.textColor),
                  ),
                  fontFamily: 'Urbanist',
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: AppColors.black),
                      color: AppColors.white,
                      foregroundColor: AppColors.black,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.dark,
                          statusBarBrightness: Brightness.light))));
        });
  }
}
