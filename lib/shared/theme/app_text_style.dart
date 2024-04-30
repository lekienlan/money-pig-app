import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle heading2XL({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.32,
      height: 1.33,
      color: color,
    );
  }

  static TextStyle headingXL({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.25,
      color: color,
    );
  }

  static TextStyle headingL({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.14,
      color: color,
    );
  }

  static TextStyle headingM({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.17,
      color: color,
    );
  }

  static TextStyle headingS({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
      height: 1.2,
      color: color,
    );
  }

  static TextStyle bodyL({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      height: 1.2,
      color: color,
    );
  }

  static TextStyle headingXS({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.25,
      color: color,
    );
  }

  static TextStyle bodyM({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      height: 1.25,
      color: color,
    );
  }

  static TextStyle heading2XS({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.29,
      color: color,
    );
  }

  static TextStyle bodyS({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      height: 1.29,
      color: color,
    );
  }

  static TextStyle body2XS({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      height: 1.33,
      color: color,
    );
  }
}
