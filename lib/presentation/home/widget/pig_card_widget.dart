import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/util/icon_mapper.dart';
import 'package:money_pig/shared/widget/icon_select_widget.dart';
import 'package:remixicon/remixicon.dart';

class PigCardWidget extends StatelessWidget {
  final PigModel? pig;
  final Function? onClick;
  PigCardWidget({
    this.pig,
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final balance = (pig?.budget ?? 0) - (pig?.expense ?? 0);
    final percent = balance / (pig?.budget ?? 0) * 100;

    return Hero(
      tag: "pig-${pig?.id}",
      child: GestureDetector(
        onTap: () {
          if (isTruthy(onClick)) onClick!();
        },
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              color: ColorName.textDisabled,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [AppShadow.light],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * percent.toDouble() / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorName.white,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('${pig?.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorName.textTertiary,
                                fontSize: dynamicFontSize(
                                  text: pig?.name ?? '',
                                  defaultFontSize: 24,
                                  stepLength: 10,
                                  scale: 0.85,
                                ))),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 12,
                      top: 12,
                      child: PigCardIcon(
                        icon: IconMapper.iconList[pig?.style?.icon],
                      )),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'balance'.tr().capitalize(),
                          style: AppTextStyle.bodyXS(
                            color: ColorName.textTertiary,
                          ),
                        ),
                        Text(formatCurrency(balance),
                            style: AppTextStyle.headingXS(
                              color: ColorName.primaryMain,
                            ).copyWith(
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class PigCardIcon extends StatelessWidget {
  final IconData? icon;
  final Function(String?, IconData?)? onChange;
  const PigCardIcon({super.key, this.icon, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorName.primaryMain,
        ),
        child: Center(
          child: IconSelectWidget(
            onChange: onChange,
            icon: icon ?? Remix.heart_fill,
          ),
        ),
      ),
    );
  }
}
