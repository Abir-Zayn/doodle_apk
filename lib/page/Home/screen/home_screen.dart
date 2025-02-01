import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/page/Home/models/app_restaurant_model.dart';
import 'package:doodle_apk_test/page/Home/models/json_resturant_model.dart';
import 'package:doodle_apk_test/page/Home/widgets/display_category.dart';
import 'package:doodle_apk_test/page/Home/widgets/display_restaurant.dart';
import 'package:doodle_apk_test/page/Home/widgets/display_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fetchRestaurant = JsonResturantModel();
  late String jsonData;
  late List<Restaurant> restaurantList;

  @override
  void initState() {
    super.initState();
    jsonData = fetchRestaurant.jsonData;
    restaurantList = Restaurant.fromJsonList(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              DisplayTopAppBar(),
              SizedBox(height: 10.h),
              Row(
                children: [
                  AppTextstyle(
                    text: 'Hey User 101 !!, ',
                    style: appStyle(
                      size: 16.sp,
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppTextstyle(
                    text: 'Good Morning!',
                    style: appStyle(
                      size: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              AppTextstyle(
                text: 'Choose your cravings',
                style: appStyle(
                  size: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              DisplayCategory(),
              SizedBox(height: 10.h),
              AppTextstyle(
                text: 'All Restaurant',
                style: appStyle(
                  size: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h), // Added spacing before list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    // Added padding around each restaurant
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: DisplayRestaurant(restaurant: restaurantList[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
