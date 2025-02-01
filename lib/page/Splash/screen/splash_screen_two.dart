import 'package:doodle_apk_test/common/widget/app_bg_radius.dart';
import 'package:doodle_apk_test/common/widget/app_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Splash Screen Image Container with Gradient Overlay
            ClipPath(
              clipper: AppBgRadius(),
              child: Container(
                height: 0.6.sh,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/image/foodorder.png',
                      ),
                      fit: BoxFit.cover),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink.withOpacity(0.9),
                      Colors.pink.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Splash Screen Heading Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTextstyle(
                text: 'Hold your clock!!',
                style: appStyle(
                    size: 30.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10.h),

            // Splash Screen Sub Heading Text
            AppTextstyle(
              text:
                  'Get your foods on hand in 30~40 mins\n     all you have to do is make a call',
              style: appStyle(
                  size: 15.sp,
                  color: Colors.grey[700]!,
                  fontWeight: FontWeight.normal),
            ),

            const SizedBox(height: 100),

            // Get Started Button
            AppButton(
              onTap: () {
                // Navigate to the next screen
                context.go('/login');
              },
              btnWidth: 320.w,
              btnHeight: 50.h,
              radius: 12.r,
              text: 'Get Started',
              textSize: 18.sp,
              borderColor: Colors.pink,
              btnColor: Colors.pink,
              textColor: Colors.white,
            ),

            SizedBox(height: 10.h),

            //Skip Button
            AppButton(
              onTap: () {
                // Navigate to the next screen
                context.go('/home');
              },
              btnWidth: 320.w,
              btnHeight: 50.h,
              radius: 12.r,
              text: 'Skip',
              textSize: 18.sp,
              borderColor: Colors.white,
              btnColor: Colors.transparent,
              textColor: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
