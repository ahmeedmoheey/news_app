import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';


class AppStyles {
  static TextStyle appBar = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle drawerTitle = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.white,
  );
  static TextStyle categories = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackAcc,
  );
  static TextStyle pickCategory = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.grewAcc,
  );
  static TextStyle categoryTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle sourceName = GoogleFonts.poppins(
    color: Color(0xFF79828B),
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle articleTitle = GoogleFonts.poppins(
    color: Color(0xFF42505C),
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle publishedAt = GoogleFonts.inter(
    color: Color(0xFFA3A3A3),
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle selectedLabel = GoogleFonts.exo(
      color: ColorsManager.white, fontSize: 14.sp, fontWeight: FontWeight.w400);

  static TextStyle unSelectedLabel = GoogleFonts.exo(
    color: ColorsManager.green, fontSize: 14.sp, fontWeight: FontWeight.w400,);
}