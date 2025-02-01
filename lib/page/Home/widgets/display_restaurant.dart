import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/page/Home/models/app_restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DisplayRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const DisplayRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/restaurant_info', extra: restaurant);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Image Section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  restaurant.restaurantImg,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //  Restaurant Name & Type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextstyle(
                    text: restaurant.restaurantName,
                    style: appStyle(
                      size: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  AppTextstyle(
                    text: "Pizza - Burger - Fries",
                    style: appStyle(
                      size: 14,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            //  Ratings, Delivery Time & Cooking Time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoRow(
                      Icons.star, Colors.yellow, restaurant.star.toString()),
                  _buildInfoRow(Icons.delivery_dining, Colors.green,
                      restaurant.deliveryTime),
                  _buildInfoRow(
                      Icons.timer, Colors.red, restaurant.cookingTime),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Helper Widget for Icons + Text
  Widget _buildInfoRow(IconData icon, Color iconColor, String text) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 4),
        AppTextstyle(
          text: text,
          style: appStyle(
            size: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
