import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/AppColor.dart';


class AppStyle {
  
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor:Colors.white,
      scrolledUnderElevation: 0.0,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorManager.lightSecondaryColor,
        size: 27.sp,
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.lightSecondaryColor,
        fontSize: 25.sp,
        fontWeight: FontWeight.w600,
        fontFamily: "Great Vibes",
      ),
    ),
    colorScheme:  ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 92, 7, 219),
      primary: ColorManager.lightPrimaryColor,
      secondary: ColorManager.lightSecondaryColor,
      onPrimary:  ColorManager.darkGreyColor,
      onSecondary:  ColorManager.lightGreyColor
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 35.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Great Vibes",
          color:  ColorManager.lightSecondaryColor,
        ),
        headlineSmall: TextStyle(
          color: ColorManager.lightPrimaryColor, 
          fontSize: 27.sp,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
          color: ColorManager.lightSecondaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: 20.sp,
          color: ColorManager.lightPrimaryColor,
        )
      )
  );





  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorManager.darkSecondaryColor,
        size: 27.sp,
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.darkSecondaryColor,
        fontSize: 25.sp,
        fontWeight: FontWeight.w600,
        fontFamily: "Great Vibes",
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 92, 7, 219),
      primary: ColorManager.darkPrimaryColor,
      secondary: ColorManager.darkSecondaryColor,
      onPrimary: ColorManager.darkGreyColor,
      onSecondary: ColorManager.darkGreyColor
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 35.sp,
        fontWeight: FontWeight.w700,
        fontFamily: "Great Vibes",
        color: ColorManager.darkSecondaryColor,
      ),
      headlineSmall: TextStyle(
        color: ColorManager.darkPrimaryColor, 
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        fontFamily: "Inter",
        color: ColorManager.darkSecondaryColor,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: ColorManager.darkSecondaryColor,
      )
    ),
  );
}

