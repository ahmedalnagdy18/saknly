import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/fonts/app_text.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      title: SizedBox(
        height: 100.r,
        child: Image.asset("assets/images/sucsess_icon.png"),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "OTP Confirmed",
            textAlign: TextAlign.center,
            style: AppTexts.meduimBody.copyWith(
              color: AppColors.green10,
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
            ),
          ),
          const SizedBox(height: 20),
          MainAppButton(
            bouttonWidth: double.infinity,
            onPressed: onPressed,
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
