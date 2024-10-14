import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_assessment/views/uiElements/circleContainer.dart';
import 'package:real_estate_assessment/views/uiElements/generalIconDisplay.dart';

class TextSearchField extends StatelessWidget {
  final Duration duration;
  const TextSearchField({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 12.h,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
            ),
            child: Row(
              children: [
                GeneralIconDisplay(
                    Icons.search_sharp, Colors.black, UniqueKey(), 25.h),
                10.horizontalSpace,
                const Text('Saint Petersburg')
              ],
            ),
          ).animate().scale(duration: duration),
        ),
        18.horizontalSpace,
        CircularContainer(
          backgroundColor: Colors.white,
          child: GeneralIconDisplay(Icons.sort, Colors.black, UniqueKey(), 18),
        ).animate().scale(duration: duration),
      ],
    );
  }
}
