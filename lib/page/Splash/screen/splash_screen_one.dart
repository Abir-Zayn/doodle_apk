import 'package:doodle_apk_test/common/widget/app_bg_radius.dart';
import 'package:doodle_apk_test/common/widget/app_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

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
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/burger.png'),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink.withOpacity(0.6),
                      Colors.pink.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),

            // Splash Screen Heading Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTextstyle(
                text: 'Find your cravings',
                style: appStyle(
                    size: 30.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // Splash Screen Sub Heading Text
            AppTextstyle(
              text:
                  'Get all your loved foods in one place,\n     all you have to do is make a call',
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
                context.go('/splash_two');
              },
              btnWidth: 320.w,
              btnHeight: 50.h,
              radius: 10.r,
              text: 'Get Started',
              textSize: 18.sp,
              borderColor: Colors.pink,
              btnColor: Colors.pink,
              textColor: Colors.white,
            ),

            SizedBox(height: 10),

            //Skip Button
            AppButton(
              onTap: () {
                // Navigate to the next screen
                context.go('/login');
              },
              btnWidth: 320.w,
              btnHeight: 50.h,
              radius: 10.r,
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
