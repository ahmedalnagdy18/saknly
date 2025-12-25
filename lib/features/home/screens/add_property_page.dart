import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/app_textfield.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/fonts/app_text.dart';
import 'package:saknly/features/home/widgets/select_image_widget.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({super.key});

  @override
  State<AddPropertyPage> createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  List<XFile>? uploadedImage;

  Future<void> pickImage({required int remaining}) async {
    if (remaining <= 0) return;

    List<XFile> newImages = [];

    if (remaining == 1) {
      final singleImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (singleImage != null) {
        newImages.add(singleImage);
      }
    } else {
      final pickedImages = await ImagePicker().pickMultiImage(
        limit: remaining,
      );
      newImages.addAll(pickedImages);
    }

    if (newImages.isEmpty) return;

    setState(() {
      uploadedImage = <XFile>[
        ...(uploadedImage ?? <XFile>[]),
        ...newImages,
      ].take(3).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add Property",
          style: AppTexts.regularBody.copyWith(
            color: AppColors.green10,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          disabledColor: Colors.transparent,
          color: AppColors.green10,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColors.green6.withAlpha(50),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_double_arrow_left_rounded,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          // also hide keyboard automatic
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            // hide keyboard automatic
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.h),
                  Text(
                    "Basic Information",
                    style: AppTexts.regularBody.copyWith(
                      color: AppColors.green10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: "Property Title",
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    hintText: "Property Type",
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.green5,
                    ),
                  ),
                  SizedBox(height: 42.h),
                  Text(
                    "Location",
                    style: AppTexts.regularBody.copyWith(
                      color: AppColors.green10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: "City",
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    hintText: "Area",
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    hintText: "Full Address",
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    hintText: "Pin Property Location",
                    suffixIcon: Icon(
                      Icons.location_pin,
                      color: AppColors.green5,
                    ),
                  ),
                  SizedBox(height: 42.h),
                  Text(
                    "Pricing",
                    style: AppTexts.regularBody.copyWith(
                      color: AppColors.green10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: "Total Sale Price",
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    hintText: "Installments Available",
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.green5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    hintText: "Installments Details",
                    maxLines: 4,
                    minLines: 3,
                  ),
                  SizedBox(height: 42.h),
                  Text(
                    "Image",
                    style: AppTexts.regularBody.copyWith(
                      color: AppColors.green10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SelectImageWidget(
                    uploadedImage: uploadedImage,
                    onAddImage: () {
                      final currentCount = uploadedImage?.length ?? 0;
                      final remaining = 3 - currentCount;

                      if (remaining > 0) {
                        pickImage(remaining: remaining);
                      }
                    },
                    onRemoveImage: (index) {
                      setState(() {
                        uploadedImage!.removeAt(index);
                      });
                    },
                  ),

                  SizedBox(height: 42.h),
                  Text(
                    "Amenities",
                    style: AppTexts.regularBody.copyWith(
                      color: AppColors.green10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: "Amenities Details",
                    maxLines: 4,
                    minLines: 3,
                  ),
                  SizedBox(height: 42.h),
                  Text(
                    "Additional Information",
                    style: AppTexts.regularBody.copyWith(
                      color: AppColors.green10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: "Special Notes",
                    maxLines: 4,
                    minLines: 3,
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: "Nearby Landmarks",
                    maxLines: 4,
                    minLines: 3,
                  ),
                  SizedBox(height: 42.h),
                  MainAppButton(
                    bouttonWidth: double.infinity,
                    text: 'Publish',
                    onPressed: () {},
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
