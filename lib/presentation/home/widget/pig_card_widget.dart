import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/util/icon_mapper.dart';
import 'package:money_pig/shared/widget/icon_select_widget.dart';
import 'package:remixicon/remixicon.dart';

class PigCardWidget extends StatelessWidget {
  final PigModel? pig;
  final Function? onTap;
  final Function(BuildContext context)? onLongPress;
  PigCardWidget({
    this.pig,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final balance = (pig?.budget ?? 0) - (pig?.expense ?? 0);
    final percent = balance / (pig?.budget ?? 0) * 100;

    return Hero(
      tag: "pig-${pig?.id}",
      child: GestureDetector(
        onLongPress: () {
          if (isTruthy(onLongPress)) {
            HapticFeedback.lightImpact();
            onLongPress!(context);
          }
          ;
        },
        onTap: () {
          if (isTruthy(onTap)) onTap!();
        },
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.textDisabled,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [AppShadow.hard],
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
                        color: AppColor.surfacePrimary,
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
                                color: AppColor.textTertiary,
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
                            color: AppColor.textTertiary,
                          ),
                        ),
                        Text(formatCurrency(balance),
                            style: AppTextStyle.headingXS(
                              color: AppColor.primaryMain,
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
          color: AppColor.primaryUltraLight,
        ),
        child: Center(
          child: IconSelectWidget(
            onChange: onChange,
            color: AppColor.primaryMain,
            icon: icon ?? Remix.heart_fill,
          ),
        ),
      ),
    );
  }
}
