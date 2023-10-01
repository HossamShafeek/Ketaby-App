import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.indigo,
    unselectedWidgetColor: AppColors.grey,
    textTheme: GoogleFonts.montserratTextTheme(),
    primaryColor: AppColors.indigo,
    //primarySwatch: MaterialColor(0xff673ab7, color),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: AppConstants.systemUiOverlayStyleDark,
        titleTextStyle: AppStyles.textStyle25,
        centerTitle: true),
  );
}
