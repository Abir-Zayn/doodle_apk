import 'package:doodle_apk_test/common/widget/app_icon_button.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String foodName;
  final String foodDescription;
  final double foodPrice;

  const FoodDetailScreen({
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantity = 1;
  String? selectedVariation;
  final TextEditingController _specialRequestController =
      TextEditingController();

  Map<String, double> variations = {
    '1:1': 120,
    '1:2': 240,
    '1:4': 320,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  widget.imageUrl,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40.h,
                  left: 10.w,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Colors.white, size: 24.sp),
                    onPressed: () => context.go('/home'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodName,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 50.h,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.foodDescription,
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 190, 229),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Add variation',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600)),
                            Text('*Required',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.pink.shade700)),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        ...variations.entries.map((entry) {
                          return RadioListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(entry.key,
                                    style: TextStyle(fontSize: 14.sp)),
                                Text('AED ${entry.value.toStringAsFixed(0)}',
                                    style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                            value: entry.key,
                            groupValue: selectedVariation,
                            onChanged: (value) {
                              setState(() {
                                selectedVariation = value.toString();
                              });
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AppTextstyle(
                    text: 'Special requests (Optional)',
                    style: appStyle(
                        size: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: _specialRequestController,
                    decoration: InputDecoration(
                      hintText: 'e.g Hello',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      contentPadding: EdgeInsets.all(10.w),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 24.h),
                  AppIconButton(
                    icon: Ionicons.mail,
                    text: "Add to Cart",
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    btnColor: Colors.pink.shade700,
                    btnRadius: 20.r.toInt(),
                    onPressed: () {
                      context.go('/cart');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 4.r, offset: Offset(0, -2))
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 219, 175, 221),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: AppTextstyle(
                text:
                    'AED ${((selectedVariation != null ? variations[selectedVariation]! : 120) * quantity).toStringAsFixed(0)}',
                style: appStyle(
                    size: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 4.w),
            Spacer(),
            IconButton(
              icon: Icon(Icons.remove_circle_outline, size: 24.sp),
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
            ),
            Text(quantity.toString(),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(Icons.add_circle_outline, size: 24.sp),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
