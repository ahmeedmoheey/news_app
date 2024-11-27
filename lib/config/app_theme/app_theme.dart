import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';
class AppTheme{
  static final ThemeData light =ThemeData(
    scaffoldBackgroundColor:Colors.transparent,
  appBarTheme:  const AppBarTheme(
    iconTheme: IconThemeData(
      color: ColorsManager.white
    ),
    centerTitle: true,
    backgroundColor: ColorsManager.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
    )
  )
  );
}