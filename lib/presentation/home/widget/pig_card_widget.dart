import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
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
                color: ColorName.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [AppShadow.light]),
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
                        color: ColorName.primaryLight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                '${pig?.name}',
                                style: TextStyle(
                                  color: ColorName.primaryDark,
                                  // fontWeight: FontWeight.w600,
                                  fontSize: dynamicFontSize(
                                    text: pig?.name ?? '',
                                    defaultFontSize: 20,
                                    stepLength: 6,
                                    scale: 0.9,
                                  ),
                                ),
                              ),
                            ),
                            PigCardIcon()
                          ],
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'balance'.tr().capitalize(),
                                style: AppTextStyle.bodyXS(
                                  color: percent < 30
                                      ? ColorName.primaryExtraLight
                                      : ColorName.primaryUltraLight,
                                ),
                              ),
                              Text(formatCurrency(balance),
                                  style: AppTextStyle.headingS(
                                    color: percent < 30
                                        ? ColorName.primaryExtraLight
                                        : ColorName.primaryUltraLight,
                                  ).copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
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
  const PigCardIcon({
    super.key,
  });

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
            icon: Remix.heart_fill,
          ),
        ),
      ),
    );
  }
}
