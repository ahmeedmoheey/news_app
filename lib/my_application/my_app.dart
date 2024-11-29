import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/app_theme/app_theme.dart';
import 'package:news_app/presentation/home/home_screen.dart';
import 'package:news_app/splash_screen/splash_screen.dart';

import '../core/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(412,870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>MaterialApp(
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.splash : (_) => SplashScreen(),
          RoutesManager.home: (_) => Home(),
        },
        initialRoute: RoutesManager.splash,
      ) ,
    );




  }
}
