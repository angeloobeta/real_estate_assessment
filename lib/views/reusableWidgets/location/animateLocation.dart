import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_assessment/model/utilities/functions/hexColor.dart';
import 'package:real_estate_assessment/views/uiElements/generalTextDisplay.dart';

class AnimateLocation extends StatefulWidget {
  final bool isClicked;
  final BoxConstraints boxConstraints;
  const AnimateLocation({
    super.key,
    required this.boxConstraints,
    required this.isClicked,
  });

  @override
  State<AnimateLocation> createState() => _HeatMapState();
}

class _HeatMapState extends State<AnimateLocation> {
  late Offset position;
  late String randomGenerated;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  Offset getPosition() {
    final Random random = Random();
    // Generate a random number between 10 and 100, formatted as a string
    randomGenerated =
        (20 + random.nextDouble() * 50).toStringAsFixed(2).replaceAll('.', ',');

    // Calculate maximum left and top offsets
    final maxLeft = widget.boxConstraints.maxWidth - 30;
    final maxTop = widget.boxConstraints.maxHeight - 30;

    // Return a random Offset within the calculated bounds
    return Offset(random.nextDouble() * maxLeft, random.nextDouble() * maxTop);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - 30.w,
      top: position.dy,
      child: AnimatedContainer(
        duration: 0.9.seconds,
        width: widget.isClicked ? 90.w : 40.w,
        height: 40.w,
        padding: EdgeInsets.all(5.r),
        decoration: ShapeDecoration(
          color: hexColor('FC9D11'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
              bottomRight: Radius.circular(10.r),
            ),
          ),
        ),
        child: widget.isClicked
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: generalTextDisplay('$randomGenerated mn ₽',
                    hexColor("FFFFFF"), 12.h, FontWeight.w700, 1, ''),
              )
            : const Icon(
                Icons.house,
                color: Colors.white,
              ),
      ).animate().scale(delay: 0.4.seconds, duration: 0.5.seconds),
    );
  }
}
