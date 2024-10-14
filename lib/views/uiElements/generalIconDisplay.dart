import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralIconDisplay extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Key iconKey;

  GeneralIconDisplay(this.icon, this.iconColor, this.iconKey, this.iconSize);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      key: iconKey,
      size: iconSize.h,
      color: iconColor,
    );
  }
}
