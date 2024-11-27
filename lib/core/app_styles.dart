import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class AppStyles{
  static   TextStyle appTitle = GoogleFonts.exo(
    fontSize:22,
    fontWeight: FontWeight.w400,
      color: ColorsManager.white
  );
  static   TextStyle drawerTitle = GoogleFonts.poppins(
    fontSize:24,
    fontWeight: FontWeight.w700,
      color: ColorsManager.white
  );
  static   TextStyle categories = GoogleFonts.poppins(
    fontSize:24,
    fontWeight: FontWeight.w700,
      color: ColorsManager.blackAcc
  );
  static   TextStyle settings = GoogleFonts.poppins(
    fontSize:24,
    fontWeight: FontWeight.w700,
      color: ColorsManager.blackAcc
  );
  static   TextStyle language = GoogleFonts.poppins(
    fontSize:14,
    fontWeight: FontWeight.w700,
      color: ColorsManager.blackAcc
  );
  static   TextStyle english = GoogleFonts.inter(
    fontSize:14,
    fontWeight: FontWeight.w400,
      color: ColorsManager.blackAcc
  );
  static   TextStyle homeCategory = GoogleFonts.poppins(
    fontSize:22,
    fontWeight: FontWeight.w700,
      color: ColorsManager.grewAcc
  );
  static   TextStyle categoryTitle = GoogleFonts.exo(
    fontSize:22,
    fontWeight: FontWeight.w400,
      color: ColorsManager.white
  );
}