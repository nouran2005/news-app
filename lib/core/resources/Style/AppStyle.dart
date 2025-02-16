import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/AppColor.dart';


class AppStyle {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor:ColorManager.lightPrimaryColor,
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
      onPrimary: ColorManager.greyColor,
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
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
          color: ColorManager.lightSecondaryColor,
        ),/*
        titleSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.descriptionColor,
        )*/
      )
  );


  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor:ColorManager.lightSecondaryColor,
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
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 35.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Great Vibes",
          color:  ColorManager.lightSecondaryColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        /*titleMedium: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.greyColor,
        ),
        titleSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.descriptionColor,
        )*/
      )
  );
}

