import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:saknly/core/colors/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this.controller,
    this.onCompleted,
    this.color,
  });
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      separatorBuilder: (index) => SizedBox(width: 16.w),
      onCompleted: onCompleted,
      controller: controller,
      preFilledWidget: const Text(
        '',
        style: TextStyle(color: AppColors.error),
      ),
      errorText: 'Invalid OTP',
      errorTextStyle: const TextStyle(
        color: Colors.red,
      ),
      defaultPinTheme: PinTheme(
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: color ?? AppColors.green10,
        ),
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: AppColors.green4,
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(
            color: AppColors.green4,
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      length: 4,
      focusedPinTheme: PinTheme(
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.green10,
        ),
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(
            color: AppColors.green10,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
