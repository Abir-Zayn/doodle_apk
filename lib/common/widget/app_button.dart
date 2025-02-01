import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? radius;
  final String text;
  final double? textSize;
  final Color? borderColor;
  final Color? btnColor;
  final Color? textColor;

  const AppButton({
    super.key,
    this.textColor,
    this.onTap,
    this.btnWidth,
    this.btnHeight,
    this.radius,
    required this.text,
    this.textSize,
    this.borderColor,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? double.infinity, // Default to full width
        height: btnHeight ?? 50, // Default height
        decoration: BoxDecoration(
          color: btnColor ?? Colors.pink, // Default button color
          borderRadius: BorderRadius.circular(radius ?? 10), // Default radius
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 2)
              : null, // Border if provided
        ),
        child: Center(
            child: AppTextstyle(
                text: text,
                style: appStyle(
                    size: textSize ?? 20,
                    color: textColor ?? Colors.black,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
