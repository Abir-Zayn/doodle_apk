import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final String name;
  final String quantity;
  final String price;
  final String description;
  final Color quantityBadgeColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const CartItemCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    this.quantityBadgeColor = Colors.pink,
    this.fontSize = 16,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quantity Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: quantityBadgeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              quantity,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(width: 12),

          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: fontSize - 2,
                  ),
                ),
              ],
            ),
          ),

          // Price
          Text(
            price,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
