import 'package:doodle_apk_test/common/widget/app_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/common/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRegisterScreen extends StatefulWidget {
  const AppRegisterScreen({super.key});

  @override
  State<AppRegisterScreen> createState() => _AppRegisterScreenState();
}

class _AppRegisterScreenState extends State<AppRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              AppTextstyle(
                text: 'Hello There!!',
                style: appStyle(
                  size: 22.sp,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
                textAlign: TextAlign.left,
              ),
              AppTextstyle(
                text: "Sign Up to Continue",
                style: appStyle(
                  size: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              AppTextstyle(
                text:
                    "Doodle doesnt make you go broke along with fill you cravings with amazing deals",
                style: appStyle(
                  size: 14.sp,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
              ),
              SizedBox(height: 40.h),
              AppTextfield(
                hintText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icon(
                  Ionicons.mail_outline,
                  size: 18.sp,
                ),
              ),
              SizedBox(height: 8.h),
              AppTextfield(
                hintText: 'Phone Number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                suffixIcon: Icon(Ionicons.phone_portrait_outline, size: 18.sp),
              ),
              SizedBox(height: 8.h),
              AppTextfield(
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(Ionicons.lock_closed_outline, size: 18.sp),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    'By Signing up you agree with our \nterms and conditions and privacy policy',
                    style: appStyle(
                      size: 12.sp,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              AppButton(
                onTap: () {
                  context.go('/home');
                },
                btnWidth: MediaQuery.of(context).size.width,
                btnHeight: 50.h,
                radius: 25.r,
                text: 'Sign up',
                textSize: 16.sp,
                borderColor: Colors.white,
                btnColor: Colors.pink,
                textColor: Colors.white,
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or Sign up with',
                    style: appStyle(
                      size: 14.sp,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Ionicons.logo_facebook,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Ionicons.logo_google,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 110.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: appStyle(
                      size: 14.sp,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      context.go('/login');
                    },
                    child: Text(
                      'Sign In',
                      style: appStyle(
                        size: 14.sp,
                        color: Colors.pink,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
