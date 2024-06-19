import 'package:flutter/material.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';

abstract class AppShadow {
  static BoxShadow light = BoxShadow(
      offset: Offset(1, 2),
      blurRadius: 2,
      spreadRadius: 0,
      color: ColorName.neutral800.withOpacity(0.08));

  static BoxShadow normal = BoxShadow(
      offset: Offset(1, 2),
      blurRadius: 5,
      spreadRadius: 0,
      color: ColorName.neutral800.withOpacity(0.1));

  static BoxShadow hard = BoxShadow(
      offset: Offset(1, 3),
      blurRadius: 8,
      spreadRadius: 0,
      color: ColorName.neutral800.withOpacity(0.1));

  static BoxShadow withSpreadRadius(double spreadRadius) {
    return BoxShadow(
      offset: Offset(0, 0),
      blurRadius: 10,
      color: ColorName.neutral800.withOpacity(0.05),
      spreadRadius: spreadRadius,
    );
  }
}
