import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/page/Detailed/model/food_info_convert.dart';
import 'package:doodle_apk_test/page/Detailed/widgets/food_details_no_var.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItemCard extends StatefulWidget {
  final FoodInfoConvert foodItem;
  const MenuItemCard({super.key, required this.foodItem});

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  void showFoodDetails(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => FoodDetailsNoVar(
              imageUrl: widget.foodItem.foodImg,
              foodName: widget.foodItem.foodName,
              foodDescription: widget.foodItem.foodDescription,
              foodPrice: 120,
            ));
  }

  Future<void> handleNav() async {
    if (widget.foodItem.hasVariant) {
      context.go('/hasVarient', extra: {
        'imageUrl': widget.foodItem.foodImg,
        'foodName': widget.foodItem.foodName,
        'foodDescription': widget.foodItem.foodDescription,
        'foodPrice': widget.foodItem.foodPrice.toString()
      });
    } else {
      showFoodDetails(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey.withOpacity(0.6),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: handleNav,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppTextstyle(
                              maxLines: 2,
                              text: widget.foodItem.foodName,
                              style: appStyle(
                                  size: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        widget.foodItem.foodDescription,
                        style: TextStyle(
                          color: Colors.grey[600],
                          height: 1.3,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              'AED ${widget.foodItem.foodPrice}',
                              style: TextStyle(
                                color: Colors.pink.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14.sp,
                                color: Colors.amber.shade600,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                widget.foodItem.foodRating.toString(),
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                '(128)',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Stack(
                  children: [
                    Hero(
                      tag: 'menu_item_image',
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 8.r,
                              offset: Offset(0, 3.h),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            widget.foodItem.foodImg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6.h,
                      right: 6.w,
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.shopping_bag,
                          size: 16.sp,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
