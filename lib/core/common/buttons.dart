import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/fonts/app_text.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.padding,
    this.bouttonWidth,
    this.backgroundColor,
  });
  final void Function()? onPressed;
  final String? text;
  final Widget? icon;
  final double? bouttonWidth;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsGeometry.zero,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsetsGeometry.symmetric(vertical: 10.h),
          ),
          minimumSize: WidgetStatePropertyAll(Size(bouttonWidth ?? 0, 40)),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.green10,
          ),
          iconColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        onPressed: onPressed,
        label: Text(
          text ?? "",
          style: AppTexts.regularBody.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        icon: icon,
        iconAlignment: IconAlignment.end,
      ),
    );
  }
}
