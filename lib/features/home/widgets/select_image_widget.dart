import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/fonts/app_text.dart';

class SelectImageWidget extends StatelessWidget {
  const SelectImageWidget({
    super.key,
    required this.uploadedImage,
    required this.onAddImage,
    required this.onRemoveImage,
  });

  final List<XFile>? uploadedImage;
  final VoidCallback onAddImage;
  final void Function(int index) onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(width: 32.w),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          final hasImage =
              uploadedImage != null && index < uploadedImage!.length;

          return GestureDetector(
            onTap: hasImage ? null : onAddImage,
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                border: hasImage
                    ? null
                    : DashedBorder.all(
                        dashLength: 5,
                        color: AppColors.green10,
                      ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: hasImage
                  ? Stack(
                      children: [
                        Positioned.fill(
                          child: Image.file(
                            File(uploadedImage![index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: GestureDetector(
                            onTap: () => onRemoveImage(index),
                            child: Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black54,
                              ),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                                size: 18.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 41.r,
                          width: 50.r,
                          child: SvgPicture.asset(
                            'assets/images/upload_icon.svg',
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Add Photo",
                          style: AppTexts.regularBody.copyWith(
                            color: AppColors.green10,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
