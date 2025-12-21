import 'package:flutter/material.dart';
import 'package:saknly/core/fonts/app_text.dart';

class OpenGallaryWidget extends StatelessWidget {
  const OpenGallaryWidget({
    super.key,
    required this.photosTap,
    required this.cameraTap,
  });
  final Function()? photosTap;
  final Function()? cameraTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Upload', style: AppTexts.meduimHeading),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Divider(),
              SizedBox(height: 16),
              GestureDetector(
                onTap: photosTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.photo, size: 24),
                    SizedBox(width: 14),
                    Text('photos', style: AppTexts.regularBody),
                  ],
                ),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: cameraTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.camera_alt_outlined, size: 24),
                    SizedBox(width: 14),
                    Text('camera', style: AppTexts.regularBody),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
