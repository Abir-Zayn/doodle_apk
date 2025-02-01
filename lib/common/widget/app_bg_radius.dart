import 'package:flutter/material.dart';

class AppBgRadius extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from the top-left corner
    path.moveTo(0, 0);

    // Draw a straight line to the bottom-left corner
    path.lineTo(0, size.height - 50);

    // Draw a quadratic bezier curve to create the rounded bottom middle
    path.quadraticBezierTo(
      size.width / 2, // Control point (middle of the bottom)
      size.height, // Bottom middle point
      size.width, // End point (bottom-right)
      size.height - 50, // End point (bottom-right, slightly above)
    );

    // Draw a straight line to the top-right corner
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // No need to reclip unless the size changes
  }
}
