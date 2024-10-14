import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_assessment/model/utilities/constants/colors.dart';

Widget generalTextDisplay(
        final String? inputText,
        final Color? color,
        final double? textFontSize,
        final FontWeight? textFontWeight,
        final int? noOfTextLine,
        final String? textSemanticLabel,
        {Color? textColor,
        TextDecoration? textDecoration,
        TextAlign? textAlign,
        Color? decorationColor,
        List<Shadow>? shadow}) =>
    Text(
      inputText!,
      style: TextStyle(
          // add line height to the text widget if the design look different
          color: color,
          letterSpacing: 0.02,
          fontSize: textFontSize!.h,
          shadows: shadow ?? [],
          fontWeight: textFontWeight,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? black,
          decorationStyle: TextDecorationStyle.solid),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
