import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularContainer extends StatelessWidget {
  final Color? backgroundColor;
  final double size; // Make size non-nullable with a default value
  final Widget? child;
  final bool isRect;

  const CircularContainer({
    super.key,
    this.backgroundColor,
    this.size = 45, // Default size if not provided
    this.isRect = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 600), // Specify duration directly
        width: isRect ? null : size.r,
        height: size.r,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: isRect ? BoxShape.rectangle : BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
