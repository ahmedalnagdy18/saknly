import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/app_textfield.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/common/main_appbar.dart';
import 'package:saknly/core/fonts/app_text.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscure1 = true;
  bool isObscure2 = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                      Center(
                        child: Text(
                          "Creat New Password",
                          style: AppTexts.largeHeading.copyWith(
                            color: AppColors.green10,
                          ),
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Center(
                          child: Column(
                            children: [
                              AppTextField(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscure1 = !isObscure1;
                                    });
                                  },
                                  child: Icon(
                                    isObscure1
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 22.r,
                                    color: AppColors.green10,
                                  ),
                                ),
                                obscureText: isObscure1,
                                controller: passwordController,
                                hintText: 'New Password',
                                hintTextColor: AppColors.white,
                                fillColor: AppColors.green4,
                              ),
                              SizedBox(height: 24.h),
                              AppTextField(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscure2 = !isObscure2;
                                    });
                                  },
                                  child: Icon(
                                    isObscure2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 22.r,
                                    color: AppColors.green10,
                                  ),
                                ),
                                obscureText: isObscure2,
                                controller: confirmPasswordController,
                                hintText: 'Confirm Password',
                                hintTextColor: AppColors.white,
                                fillColor: AppColors.green4,
                              ),
                              SizedBox(height: 36.h),
                              MainAppButton(
                                bouttonWidth: double.infinity,
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => OtpPage(),
                                  //   ),
                                  // );
                                },
                                text: 'Reset password',
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
