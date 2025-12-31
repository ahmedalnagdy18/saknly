import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/colors/app_colors.dart';
import 'package:saknly/core/common/alert_dialog_widget.dart';
import 'package:saknly/core/common/buttons.dart';
import 'package:saknly/core/common/main_appbar.dart';
import 'package:saknly/core/fonts/app_text.dart';
import 'package:saknly/features/authentication/screens/new_password_page.dart';
import 'package:saknly/features/authentication/widgets/otp_widget.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController oTpController = TextEditingController();

  @override
  void dispose() {
    oTpController.dispose();
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
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
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
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 136.r,
                              height: 147.r,
                              child: Image.asset(
                                "assets/images/saknly_logo.png",
                              ),
                            ),
                            SizedBox(height: 13.h),
                            Text(
                              "Enter the code we send to your phone number",
                              style: AppTexts.regularBody.copyWith(
                                color: AppColors.green10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "Enter 4 digita",
                              style: AppTexts.regularBody.copyWith(
                                color: AppColors.green5,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            OtpWidget(
                              controller: oTpController,
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't recelve the OTP? ",
                                  style: AppTexts.regularBody.copyWith(
                                    color: AppColors.green5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " RESEND",
                                  style: AppTexts.regularBody.copyWith(
                                    color: AppColors.green10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 36.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 26.w),
                              child: MainAppButton(
                                bouttonWidth: double.infinity,
                                onPressed: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => AlertDialogWidget(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewPasswordPage(),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                text: 'Confirm',
                              ),
                            ),
                          ],
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
