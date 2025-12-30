import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/app_textfield.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/common/main_appbar.dart';
import 'package:saknly/core/fonts/app_text.dart';
import 'package:saknly/features/authentication/screens/otp_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailOrPhController = TextEditingController();

  @override
  void dispose() {
    emailOrPhController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/auth_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 16.w),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    // to make page scroll with textfield
                    bottom: MediaQuery.viewInsetsOf(context).bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Forget Password",
                                style: AppTexts.largeHeading.copyWith(
                                  color: AppColors.green10,
                                ),
                              ),
                              SizedBox(height: 9.h),
                              SizedBox(
                                width: 136.r,
                                height: 147.r,
                                child: Image.asset(
                                  "assets/images/saknly_logo.png",
                                ),
                              ),
                              SizedBox(height: 24.h),
                              AppTextField(
                                hintTextColor: Colors.white,
                                fillColor: AppColors.green4,
                                hintText: "Email or phone number",
                              ),
                              SizedBox(height: 36.h),
                              MainAppButton(
                                bouttonWidth: double.infinity,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpPage(),
                                    ),
                                  );
                                },
                                text: 'Send Code',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
