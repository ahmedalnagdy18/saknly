import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/fonts/app_text.dart';

class PostBodyWidget extends StatelessWidget {
  const PostBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 301.h, //todo: ask here desginer
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/house.png",
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color(0x80000000),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 29.h,
              horizontal: 22.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.green5,
                      size: 22.r,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Cairo',
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.green5,
                      ),
                    ),
                  ],
                ),
                SizedBox(),
                Padding(
                  padding: EdgeInsets.only(
                    right: 70.r,
                  ), //todo: ask here desginer
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Luxury Villa with Ocean View',
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'For sale',
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.green3,
                      ),
                    ),
                    Text(
                      'Home',
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.green3,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      '\$2,500,000',
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    iconSize: 22.r,
                    disabledColor: Colors.transparent,
                    color: AppColors.green10,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_double_arrow_right_rounded,
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
