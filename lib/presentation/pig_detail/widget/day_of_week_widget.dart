import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';

class DayOfWeekWidget extends ConsumerStatefulWidget {
  const DayOfWeekWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DayOfWeekWidgetState();
}

class _DayOfWeekWidgetState extends ConsumerState<DayOfWeekWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorName.surfaceSecondary,
      ),
      child: Center(
          child: Text(
        'T2',
        style: AppTextStyle.headingXS(),
      )),
    );
  }
}
