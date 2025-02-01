import 'package:flutter/material.dart';

class BillRowItem extends StatelessWidget {
  final String title;
  final String amount;
  final bool isTotal;
  final double? totalFontSize;
  final double? regularFontSize;
  final Color? totalColor;
  final Color? regularColor;
  final FontWeight? totalFontWeight;
  final FontWeight? regularFontWeight;
  final EdgeInsetsGeometry padding;
  final TextStyle? customTitleStyle;
  final TextStyle? customAmountStyle;

  const BillRowItem({
    super.key,
    required this.title,
    required this.amount,
    this.isTotal = false,
    this.totalFontSize = 16,
    this.regularFontSize = 14,
    this.totalColor = Colors.black,
    this.regularColor = const Color(0xFF757575), // Colors.grey[600]
    this.totalFontWeight = FontWeight.bold,
    this.regularFontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.symmetric(vertical: 4),
    this.customTitleStyle,
    this.customAmountStyle,
  });

  TextStyle _getTextStyle(bool isAmount) {
    if (isTotal) {
      return isAmount
          ? (customAmountStyle ??
              TextStyle(
                fontSize: totalFontSize,
                fontWeight: totalFontWeight,
                color: totalColor,
              ))
          : (customTitleStyle ??
              TextStyle(
                fontSize: totalFontSize,
                fontWeight: totalFontWeight,
                color: totalColor,
              ));
    }
    return isAmount
        ? (customAmountStyle ??
            TextStyle(
              fontSize: regularFontSize,
              fontWeight: regularFontWeight,
              color: regularColor,
            ))
        : (customTitleStyle ??
            TextStyle(
              fontSize: regularFontSize,
              fontWeight: regularFontWeight,
              color: regularColor,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: _getTextStyle(false),
          ),
          Text(
            amount,
            style: _getTextStyle(true),
          ),
        ],
      ),
    );
  }
}
