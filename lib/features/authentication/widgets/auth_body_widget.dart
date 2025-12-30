import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/app_textfield.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/fonts/app_text.dart';
import 'package:saknly/features/authentication/screens/create_acc_page.dart';
import 'package:saknly/features/authentication/screens/forget_password_page.dart';
import 'package:saknly/features/authentication/screens/login_page.dart';

class AuthBodyWidget extends StatefulWidget {
  const AuthBodyWidget({
    super.key,
    required this.isLoginPage,
    required this.buttonPressed,
    this.fullNameController,
    required this.emailOrPhController,
    required this.passwordController,
  });
  final bool isLoginPage;
  final void Function() buttonPressed;
  final TextEditingController? fullNameController;
  final TextEditingController emailOrPhController;
  final TextEditingController passwordController;

  @override
  State<AuthBodyWidget> createState() => _AuthBodyWidgetState();
}

class _AuthBodyWidgetState extends State<AuthBodyWidget> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.isLoginPage != true ? "Create Account" : "Sign in ",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.green10,
          ),
        ),
        SizedBox(height: 32.h),
        if (widget.isLoginPage != true) ...[
          AppTextField(
            controller: widget.fullNameController,
            hintText: 'Full name ',
            hintTextColor: AppColors.white,
            fillColor: AppColors.green4,
          ),
          SizedBox(height: 24.h),
        ],
        AppTextField(
          controller: widget.emailOrPhController,
          hintText: 'Email or phone number',
          hintTextColor: AppColors.white,
          fillColor: AppColors.green4,
        ),
        SizedBox(height: 24.h),
        AppTextField(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              size: 22.r,
              color: AppColors.green10,
            ),
          ),
          obscureText: isObscure,
          controller: widget.passwordController,
          hintText: 'Password',
          hintTextColor: AppColors.white,
          fillColor: AppColors.green4,
        ),
        if (widget.isLoginPage == true) ...[
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPasswordPage(),
                ),
              );
            },
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: Text(
                "Forget password?",
                style: AppTexts.meduimBody.copyWith(
                  color: AppColors.green10,
                ),
              ),
            ),
          ),
        ],
        SizedBox(height: 36.h),
        MainAppButton(
          bouttonWidth: double.infinity,
          text: widget.isLoginPage != true ? 'Sign Up' : 'Sign in',
          onPressed: widget.buttonPressed,
        ),
        SizedBox(height: 48.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(
                        0,
                        143,
                        143,
                        143,
                      ),
                      Color(0xFF8B8B8B),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 11.w,
              ),
              child: Text(
                "or continue with",
                style: AppTexts.regularBody.copyWith(
                  color: Color(0xFF757575),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 1.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8B8B8B),
                      const Color.fromARGB(
                        0,
                        143,
                        143,
                        143,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socielIconWidget(
              image: "assets/images/google_icon.svg",
            ),
            SizedBox(width: 16.w),
            _socielIconWidget(
              image: "assets/images/facebook_logo.svg",
            ),
            SizedBox(width: 16.w),
            _socielIconWidget(
              image: "assets/images/apple_icon.svg",
            ),
          ],
        ),
        SizedBox(height: 48.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isLoginPage != true
                  ? 'Already have an account? '
                  : 'Don’t have account? ',
              style: AppTexts.regularBody.copyWith(
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.isLoginPage == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccPage(),
                    ),
                  );
                }
                if (widget.isLoginPage != true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
              },
              child: Text(
                widget.isLoginPage != true ? "Sign in" : "Sign up",
                style: AppTexts.regularBody.copyWith(
                  color: AppColors.green10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _socielIconWidget({required String image}) {
  return Container(
    padding: EdgeInsets.all(12).r,
    clipBehavior: Clip.antiAlias,
    width: 44.r,
    height: 44.r,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: SvgPicture.asset(
      image,
      fit: BoxFit.contain,
    ),
  );
}
