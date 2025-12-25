import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/app_textfield.dart';
import 'package:saknly/core/fonts/app_text.dart';
import 'package:saknly/features/home/widgets/post_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColors.green1,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.green10,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Mansoura , Egypt',
                              style: AppTexts.regularBody.copyWith(
                                color: AppColors.green10,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 56.r,
                        width: 56.r,
                        child: CircleAvatar(
                          backgroundColor: AppColors.green1,
                          child: Image.asset(
                            'assets/images/person.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Find your New House ',
                    style: AppTexts.regularBody.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: AppColors.green10,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    raduisSize: 50.r,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset(
                        'assets/images/search_icon.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    hintText: "Search",
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Categories',
                    style: AppTexts.regularBody.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    //todo: ask about if we will increase this
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoriesWidget(
                        image: 'assets/images/home_icon.svg',
                        title: "Home",
                        selectedCategory: selectedCategory,
                        onTap: () {
                          setState(() {
                            selectedCategory = "Home";
                          });
                        },
                      ),
                      categoriesWidget(
                        image: 'assets/images/vila_icon.svg',
                        title: "Villa",
                        selectedCategory: selectedCategory,
                        onTap: () {
                          setState(() {
                            selectedCategory = "Villa";
                          });
                        },
                      ),
                      categoriesWidget(
                        image: 'assets/images/office_icon.svg',
                        title: "Office",
                        selectedCategory: selectedCategory,
                        onTap: () {
                          setState(() {
                            selectedCategory = "Office";
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Recommended',
                    style: AppTexts.regularBody.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return PostBodyWidget();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget categoriesWidget({
  required String image,
  required String title,
  required String selectedCategory,
  required VoidCallback onTap,
}) {
  final bool isSelected = selectedCategory == title;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: isSelected ? AppColors.green3 : AppColors.green1,
      ),
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(width: 4.w),
          Text(
            title,
            style: AppTexts.regularBody.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.green10,
            ),
          ),
        ],
      ),
    ),
  );
}
