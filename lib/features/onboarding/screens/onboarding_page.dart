import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/features/onboarding/widgets/info_box_widget.dart';
import 'package:saknly/features/onboarding/widgets/onboarding_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = onboardingData[currentIndex];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/onboarding_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 19.h,
                  ),
                  child: IconButton(
                    iconSize: 30.r,
                    disabledColor: Colors.transparent,
                    color: currentIndex > 0
                        ? AppColors.green10
                        : Colors.transparent,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        currentIndex > 0
                            ? AppColors.green6.withAlpha(50)
                            : Colors.transparent,
                      ),
                    ),
                    onPressed: currentIndex > 0
                        ? () {
                            if (currentIndex > 0) {
                              setState(() => currentIndex--);
                            }
                          }
                        : null,
                    icon: Icon(
                      Icons.keyboard_double_arrow_left_rounded,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: SizedBox(
                              key: ValueKey(data.image),
                              height: 375.h,
                              width: 252.w,
                              child: Image.asset(
                                data.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // last box
                InfoBoxWidget(
                  currentIndex: currentIndex,
                  data: data,
                  onPressed: () {
                    if (currentIndex < onboardingData.length - 1) {
                      setState(() => currentIndex++);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
