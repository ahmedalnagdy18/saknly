// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/fonts/app_text.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final double iconSize;
  final String? title;

  const MainAppBar({
    super.key,
    this.onBack,
    this.iconSize = 26,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title ?? "",
        style: AppTexts.largeHeading.copyWith(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.green10,
        ),
      ),
      leadingWidth: 62.w,
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      elevation: 0,
      iconTheme: IconThemeData(
        size: iconSize.r,
        color: AppColors.green10,
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 16.r),
        child: Material(
          color: AppColors.green6.withAlpha(50),
          shape: CircleBorder(),
          child: InkWell(
            customBorder: CircleBorder(),
            splashColor: AppColors.green10.withOpacity(0.2),
            highlightColor: AppColors.green10.withOpacity(0.1),
            onTap: onBack ?? () => Navigator.pop(context),
            child: SizedBox(
              width: 44.r,
              height: 44.r,
              child: Icon(
                Icons.keyboard_double_arrow_left_rounded,
                color: AppColors.green10,
                size: iconSize.r,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
