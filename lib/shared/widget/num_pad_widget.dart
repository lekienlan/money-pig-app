import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';

class NumPadWidget extends StatefulWidget {
  final Function(String?) onChange;
  final Function()? onComplete;
  final num? value;

  const NumPadWidget(
      {super.key, required this.onChange, this.value, this.onComplete});

  @override
  State<NumPadWidget> createState() => _NumPadWidgetState();
}

class _NumPadWidgetState extends State<NumPadWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      '1', '2', '3', '⌫', //
      '4', '5', '6', 'action', //
      '7', '8', '9', //
      '000', '0', 'C', //
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          ..._buildButtons(buttons),
        ],
      ),
    );
  }

  List<Widget> _buildButtons(List<String> texts) {
    return texts.map((text) {
      VoidCallback? onPressed;
      if (text == '⌫')
        onPressed = _backspace;
      else if (text == 'C')
        onPressed = _remove;
      else
        onPressed = null;
      if (text.isEmpty) {
        return StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: SizedBox.shrink(),
        );
      }

      if (text == 'action') return _buildLongButton();

      return StaggeredGridTile.extent(
        crossAxisCellCount: 1,
        mainAxisExtent: 56,
        child: _buildButton(text, onPressed: onPressed),
      );
    }).toList();
  }

  Widget _buildLongButton() {
    return StaggeredGridTile.extent(
        crossAxisCellCount: 1,
        mainAxisExtent:
            56 * 3 + 16, // Adjust based on button height and spacing
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(4),
          ),
          onPressed: () {
            if (isTruthy(widget.onComplete)) {
              widget.onComplete!();
            }
          },
          child: Text(
            "${'add'.tr().capitalize()} ${'income'.tr()}",
            textAlign: TextAlign.center,
            style: AppTextStyle.headingS(color: ColorName.white),
          ),
        ));
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //   padding: EdgeInsets.all(0),
      //   minimumSize: Size(double.infinity, 56),
      //   backgroundColor: ColorName.white,
      // ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(ColorName.neutral200),
        backgroundColor: MaterialStateProperty.all(ColorName.white),
      ),
      onPressed: onPressed ?? () => _input(text),
      child: Text(
        text,
        style: AppTextStyle.headingL(color: ColorName.textSecondary),
      ),
    );
  }

  void _input(String text) {
    final value =
        (isTruthy(widget.value) ? widget.value.toString() : '') + text;
    widget.onChange(value);
  }

  void _backspace() {
    if (isTruthy(widget.value)) {
      final value = widget.value.toString();
      widget.onChange(value.substring(0, value.length - 1));
    }
  }

  void _remove() {
    widget.onChange('');
  }
}
