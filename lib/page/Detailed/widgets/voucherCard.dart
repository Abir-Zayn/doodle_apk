import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class DiscountCard extends StatelessWidget {
  final String discountAmount;
  final String discountUpto;
  final Color colorStart;
  final Color colorEnd;
  const DiscountCard({
    super.key,
    required this.discountAmount,
    required this.discountUpto,
    required this.colorStart,
    required this.colorEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      height: 75.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [colorStart, colorEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3.5.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.percent,
                  color: const Color(0xFF9C0140),
                  size: 16.sp,
                ),
              ),
              SizedBox(width: 6.w),
              AppTextstyle(
                text: discountAmount,
                style: appStyle(
                  size: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 6.w),
              AppTextstyle(
                text: discountUpto,
                style: appStyle(
                  size: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                Ionicons.bicycle_outline,
                color: Colors.white,
                size: 14.sp,
              ),
              SizedBox(width: 5.w),
              Text(
                "Free delivery",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
