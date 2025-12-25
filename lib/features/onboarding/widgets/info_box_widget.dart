import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/features/authentication/screens/create_acc_page.dart';
import 'package:saknly/features/onboarding/widgets/onboarding_model.dart';

class InfoBoxWidget extends StatelessWidget {
  final OnboardingModel data;
  final int currentIndex;
  final void Function()? onPressed;
  const InfoBoxWidget({
    super.key,
    required this.data,
    required this.currentIndex,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 282.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
        vertical: 26.h,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: -6,
          ),
        ],
        color: Colors.white.withOpacity(0.50),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(48.r),
          topLeft: Radius.circular(48.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 19.h),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                data.title,
                key: ValueKey(data.subTitle),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.green9,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              data.subTitle,
              key: ValueKey(data.subTitle),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.green9,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 19.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotsIndicator(
                  decorator: DotsDecorator(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        18.r,
                      ),
                    ),
                    activeShape: ContinuousRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        18.r,
                      ),
                    ),
                    color: AppColors.green4,
                    spacing: EdgeInsets.all(1).r,
                    size: Size(8.w, 12.h),
                    activeColor: AppColors.green5,
                    activeSize: Size(32.w, 12.h),
                  ),
                  dotsCount: onboardingData.length,
                  position: currentIndex.toDouble(),
                ),
                currentIndex != 2
                    ? SizedBox(
                        height: 48.r,
                        width: 48.r,
                        child: IconButton(
                          iconSize: 22.r,
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.green5,
                            ),
                          ),
                          onPressed: onPressed,
                          icon: Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsetsGeometry.symmetric(
                              horizontal: 25.r,
                              vertical: 8.r,
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            AppColors.green10,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Lets Go",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
