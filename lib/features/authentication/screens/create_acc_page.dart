import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saknly/core/common/main_appbar.dart';
import 'package:saknly/features/authentication/widgets/auth_body_widget.dart';
import 'package:saknly/features/home/screens/home_page.dart';

class CreateAccPage extends StatefulWidget {
  const CreateAccPage({super.key});

  @override
  State<CreateAccPage> createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailOrPhController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailOrPhController.dispose();
    passwordController.dispose();
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 16.w),
            child: SafeArea(
              child: GestureDetector(
                // also hide keyboard automatic
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  // hide keyboard automatic
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(
                    // to make page scroll with textfield
                    bottom: MediaQuery.viewInsetsOf(context).bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: AuthBodyWidget(
                            isLoginPage: false,
                            fullNameController: fullNameController,
                            emailOrPhController: emailOrPhController,
                            passwordController: passwordController,
                            buttonPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
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
