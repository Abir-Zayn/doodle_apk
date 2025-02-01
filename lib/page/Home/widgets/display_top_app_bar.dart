import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DisplayTopAppBar extends StatelessWidget {
  const DisplayTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Location Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.pink, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    "Deliver To",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                "Halishahar, Chittagong",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          // 🔹 Cart Icon with Badge
          Stack(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child:
                    Icon(Ionicons.cart_outline, color: Colors.white, size: 26),
              ),

              // 🔹 Cart Badge (for item count)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      "3", // Replace with dynamic cart count
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
