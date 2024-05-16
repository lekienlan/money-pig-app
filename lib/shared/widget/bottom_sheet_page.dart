import 'package:flutter/material.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';

class BottomSheetPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final String? barrierLabel;
  final bool useSafeArea;
  final WidgetBuilder builder;
  final bool isScrollControlled;

  const BottomSheetPage({
    required this.builder,
    this.barrierLabel,
    this.useSafeArea = true,
    this.isScrollControlled = true,
    this.anchorPoint,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
      settings: this,
      isScrollControlled: isScrollControlled,
      builder: builder,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      backgroundColor: ColorName.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))));
}
