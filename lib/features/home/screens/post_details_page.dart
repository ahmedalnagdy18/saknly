import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/common/main_appbar.dart';
import 'package:saknly/core/fonts/app_text.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MainAppBar(
        title: "Property Details",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: 264.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Image.asset(
                    "assets/images/house.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30.h),
                _titleAndPrice(),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 22.r,
                      color: AppColors.green5,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "New Cairo, Fifth Settlement",
                      style: AppTexts.meduimBody.copyWith(
                        color: AppColors.green5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _keyAndValueWidget(key: "Status badge:", value: "For Sale"),
                SizedBox(height: 8.h),
                _keyAndValueWidget(key: "Apartment Area:", value: "120 m²"),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 24.h),
                _titleWidget("Pricing"), // Pricing
                SizedBox(height: 16.h),
                _keyAndValueWidget(key: "Total Price:", value: "\$2,500,000"),
                SizedBox(height: 8.h),
                _keyAndValueWidget(
                  key: "Installments:",
                  value: "Not Available",
                ),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 24.h),
                _titleWidget("Basic Information"), // Basic Information
                SizedBox(height: 16.h),
                _keyAndValueWidget(key: "Property Type:", value: "Apartment"),
                SizedBox(height: 8.h),
                _keyAndValueWidget(key: "City:", value: "New Cairo"),
                SizedBox(height: 8.h),
                _keyAndValueWidget(
                  key: "Full Address:",
                  value: "90 Street, behind XYZ Mall",
                ),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 24.h),
                _titleWidget("Property Details"), // Property Details
                SizedBox(height: 16.h),
                _keyAndValueWidget(key: "Property Size:", value: "120 m²"),
                SizedBox(height: 8.h),
                _keyAndValueWidget(
                  key: "Number of Rooms:",
                  value: "3 bedrooms",
                ),
                SizedBox(height: 8.h),
                _keyAndValueWidget(
                  key: "Bathrooms:",
                  value: "2 Bathrooms",
                ),
                SizedBox(height: 8.h),
                _keyAndValueWidget(key: "Floor Number:", value: "3rd Floor"),
                SizedBox(height: 8.h),
                _keyAndValueWidget(
                  key: "Finishing Type:",
                  value: "Fully Finished",
                ),
                SizedBox(height: 8.h),
                _keyAndValueWidget(
                  key: "Delivery:",
                  value: "Ready to move",
                ),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 24.h), // Additional Information
                _titleWidget("Additional Information"),
                SizedBox(height: 16.h),
                Text(
                  "he apartment is newly renovated, very close to services, quiet area, excellent sunlight",
                  style: AppTexts.regularBody.copyWith(
                    color: AppColors.green5,
                  ),
                ),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 24.h), // Nearby Landmarks"
                _titleWidget("Nearby Landmarks"),
                SizedBox(height: 16.h),
                _landMarkWidget(
                  "5 mins from AUC",
                ),
                SizedBox(height: 4.h),
                _landMarkWidget("Near Point 90 Mall"),
                SizedBox(height: 4.h),
                _landMarkWidget("Close to public transportation"),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 24.h),
                MainAppButton(
                  bouttonWidth: double.infinity,
                  onPressed: () {},
                  text: 'Book',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _titleAndPrice() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          "Luxury Villa Ocean",
          style: AppTexts.largeHeading.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.green10,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 6.r),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            "\$2,500,000",
            style: AppTexts.largeHeading.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.green10,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _keyAndValueWidget({required String key, required String value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        key,
        style: AppTexts.regularBody.copyWith(
          color: AppColors.green5,
        ),
      ),
      SizedBox(width: 6.w),
      Expanded(
        child: Text(
          value,
          style: AppTexts.regularBody.copyWith(
            color: AppColors.green10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}

Widget _titleWidget(String title) {
  return Text(
    title,
    style: AppTexts.meduimBody.copyWith(
      color: AppColors.green5,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
    ),
  );
}

Widget _landMarkWidget(String data) {
  return Padding(
    padding: EdgeInsets.only(left: 8.r),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "•",
          style: AppTexts.smallHeading.copyWith(
            color: AppColors.green5,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            data,
            style: AppTexts.regularBody.copyWith(
              color: AppColors.green5,
            ),
          ),
        ),
      ],
    ),
  );
}
