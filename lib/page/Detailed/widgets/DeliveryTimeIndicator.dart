import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:flutter/material.dart';

class DeliveryTimeIndicator extends StatelessWidget {
  final String deliveryTime;
  final Icon icon;

  const DeliveryTimeIndicator({
    super.key,
    required this.deliveryTime,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon.icon,
          color: Colors.pink,
        ),
        SizedBox(width: 3.0),
        AppTextstyle(
          text: deliveryTime,
          style: appStyle(
            size: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
