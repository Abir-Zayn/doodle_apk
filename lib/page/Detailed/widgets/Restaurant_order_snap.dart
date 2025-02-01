import 'package:doodle_apk_test/common/env/api_service.dart';
import 'package:doodle_apk_test/common/widget/app_icon_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/page/Detailed/model/restaurant_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class RestaurantOrderSnap extends StatefulWidget {
  const RestaurantOrderSnap({super.key});

  @override
  State<RestaurantOrderSnap> createState() => _RestaurantOrderSnapState();
}

class _RestaurantOrderSnapState extends State<RestaurantOrderSnap> {
  late Future<RestaurantInfo?> restaurantInfo;

  @override
  void initState() {
    super.initState();
    restaurantInfo = ApiService().fetchRestaurantInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RestaurantInfo?>(
      future: restaurantInfo,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: AppTextstyle(
              text: "Error: ${snapshot.error}",
              style: appStyle(
                size: 18.sp,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final data = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          color: Colors.pink,
                          size: 18.w,
                        ),
                        SizedBox(width: 4.w),
                        AppTextstyle(
                          text: data!.deliveryMode,
                          style: appStyle(
                            size: 14.sp,
                            color: Colors.pink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Row(
                    children: [
                      AppTextstyle(
                        text: "Min Order",
                        style: appStyle(
                          size: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      AppTextstyle(
                        text: "30 ${data.currency}",
                        style: appStyle(
                          size: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  AppIconButton(
                    icon: Ionicons.information,
                    text: "More Info",
                    onPressed: () {
                      // Handle more info action
                    },
                    iconColor: Colors.blueGrey,
                    iconSize: 14.w,
                    textSize: 14.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
