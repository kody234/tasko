import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(
        color: Color(0xFF303030), fontSize: 30.sp, fontWeight: FontWeight.w900),
    headline2:
        const TextStyle(color: Color(0xFFAEAEAF), fontWeight: FontWeight.w500),
    headline3: TextStyle(
        color: Color(0xFF303030), fontWeight: FontWeight.w600, fontSize: 13.sp),
    headline4: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w800,
      color: const Color(0xFF303030),
    ),
    headline5: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 11.sp),
    headline6: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 40.sp,
      color: Color(0xFF303030),
    ),
    bodyText1: TextStyle(
        color: const Color(0xFFAEAEAF),
        fontSize: 15.sp,
        fontWeight: FontWeight.w600),
  );

  TextTheme darkTextTheme = TextTheme(
    headline1: TextStyle(
        color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w900),
    headline2:
        const TextStyle(color: Color(0xFFAEAEAF), fontWeight: FontWeight.w500),
    headline3: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.sp),
    headline4: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline5: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 11.sp),
    headline6: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 40.sp,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
        color: const Color(0xFFAEAEAF),
        fontSize: 15.sp,
        fontWeight: FontWeight.w600),
  );

  ThemeData light() {
    return ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.light,
      textTheme: lightTextTheme,
    );
  }

  ThemeData dark() {
    return ThemeData(
        brightness: Brightness.dark,
        textTheme: darkTextTheme,
        primaryColorDark: Colors.white,
        primaryColor: Colors.white);
  }
}
