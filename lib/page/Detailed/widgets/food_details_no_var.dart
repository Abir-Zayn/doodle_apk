import 'package:doodle_apk_test/common/widget/app_icon_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class FoodDetailsNoVar extends StatefulWidget {
  final String imageUrl;
  final String foodName;
  final String foodDescription;
  final double foodPrice;

  const FoodDetailsNoVar({
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
  });

  @override
  State<FoodDetailsNoVar> createState() => _FoodDetailsNoVarState();
}

class _FoodDetailsNoVarState extends State<FoodDetailsNoVar> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              width: 40.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              widget.foodName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60.h, // Constrained height to keep description visible
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  widget.foodDescription,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextstyle(
                      text:
                          'AED ${(widget.foodPrice * quantity).toStringAsFixed(2)}',
                      style: appStyle(
                        size: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, size: 18.sp),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                          AppTextstyle(
                            text: quantity.toString(),
                            style: appStyle(
                              size: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, size: 18.sp),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                AppIconButton(
                  icon: Ionicons.mail_open,
                  text: "Add to Cart",
                  onPressed: () {
                    context.go('/cart');
                  },
                  btnColor: Colors.pink.shade700,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  btnRadius: 18.r.toInt(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
