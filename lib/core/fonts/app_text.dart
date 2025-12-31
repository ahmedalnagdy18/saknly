import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTexts {
  AppTexts._();

  // Heading
  static TextStyle largeHeading = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 32,
  );

  static TextStyle meduimHeading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle smallHeading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  // body

  static TextStyle regularBody = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle meduimBody = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle smallBody = TextStyle(fontSize: 12, color: Colors.black);
}
