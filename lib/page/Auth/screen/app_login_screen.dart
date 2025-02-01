import 'package:doodle_apk_test/common/widget/app_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/common/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen({super.key});

  @override
  State<AppLoginScreen> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends State<AppLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90.h,
              ),
              //Login Text
              AppTextstyle(
                text: 'Welcome User!!',
                style: appStyle(
                  size: 25.sp,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
                textAlign: TextAlign.left,
              ),
              AppTextstyle(
                text: "Sign In to Continue",
                style: appStyle(
                    size: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextstyle(
                text:
                    "Sign in to access the order history,status and get real-time updates with amazing deals",
                style: appStyle(
                    size: 16.sp,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400),
                maxLines: 2,
              ),

              SizedBox(
                height: 45.h,
              ),

              //Email Field
              AppTextfield(
                hintText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icon(
                  Ionicons.mail_outline,
                  size: 17.sp, // Size the icon
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              //Password Field
              AppTextfield(
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(Ionicons.lock_closed_outline, size: 18.sp),
              ),

              //Row section of Forgot Password and Remember Me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: appStyle(
                          size: 15.sp,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: false,
                          onChanged: (value) {
                            setState(() {});
                          }),
                      Text(
                        'Remember Me',
                        style: appStyle(
                            size: 15.sp,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 30.h,
              ),

              //Login Button
              AppButton(
                onTap: () {
                  context.go('/home');
                },
                // Use MediaQuery for width
                btnWidth: MediaQuery.of(context).size.width,
                btnHeight: 50.h,
                radius: 20.r,
                text: 'Sign in',
                textSize: 16.sp,
                borderColor: Colors.white,
                btnColor: Colors.pink,
                textColor: Colors.white,
              ),

              SizedBox(
                height: 30.h,
              ),

              //Row section of Social Media Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or Sign in with',
                    style: appStyle(
                        size: 13.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Ionicons.logo_facebook,
                      color: Colors.white,
                      size: 22.sp, // Size the icon
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Ionicons.logo_google,
                      color: Colors.white,
                      size: 22.sp, // Size the icon
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120.h,
              ),

              //Row section of Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: appStyle(
                        size: 14.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: Text(
                      'Sign Up',
                      style: appStyle(
                          size: 14.sp,
                          color: Colors.pink,
                          fontWeight: FontWeight.w400),
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
