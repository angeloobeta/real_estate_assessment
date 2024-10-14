import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_assessment/model/utilities/functions/hexColor.dart';

class OptionModal extends StatelessWidget {
  final String text;
  final bool selected;
  final Widget icon;
  const OptionModal({
    super.key,
    required this.text,
    this.selected = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          10.horizontalSpace,
          Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
              color: selected ? hexColor("FBAB40") : hexColor("8C8984"),
            ),
          ),
        ],
      ),
    );
  }
}
