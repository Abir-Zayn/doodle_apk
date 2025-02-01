import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final int? btnRadius;
  final Color? btnColor; // Optional button color
  final Color? iconColor; // Optional icon color
  final Color? textColor; // Optional text color
  final double iconSize; //Optional icon size
  final double textSize; //Optional text size
  final MainAxisAlignment mainAxisAlignment; // Alignment of icon and text
  final EdgeInsetsGeometry padding; // Optional padding

  const AppIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.btnRadius,
    this.iconColor,
    this.textColor,
    this.btnColor,
    this.iconSize = 24.0,
    this.textSize = 16.0,
    this.mainAxisAlignment = MainAxisAlignment.center, // Default alignment
    this.padding = const EdgeInsets.symmetric(
        horizontal: 16.0, vertical: 8.0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((btnRadius ?? 0).toDouble()),
        color: btnColor ?? Colors.white,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Icon(
              icon,
              color: iconColor ??
                  Theme.of(context)
                      .iconTheme
                      .color, // Use theme color if not specified
              size: iconSize,
            ),
            const SizedBox(width: 8.0), // Space between icon and text
            Text(
              text,
              style: TextStyle(
                color: textColor ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color, // Use theme color if not specified
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
