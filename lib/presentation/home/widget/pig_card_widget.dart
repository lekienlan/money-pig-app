import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_pig/domain/model/pig.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:remixicon/remixicon.dart';

class PigCardWidget extends StatelessWidget {
  final Pig? pig;
  PigCardWidget({
    this.pig,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        decoration: BoxDecoration(
            color: ColorName.primaryExtraLight,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [AppShadow.light]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                width: constraints.maxWidth,
                height: constraints.maxHeight *
                    ((pig?.percent?.toDouble() ?? 0) / 100),
                child: Container(
                  color: ColorName.primaryLight,
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
                              fontWeight: FontWeight.w600,
                              fontSize: dynamicFontSize(
                                text: pig?.name ?? '',
                                defaultFontSize: 20,
                                stepLength: 6,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    ColorName.surfaceSecondary.withOpacity(0.8),
                              ),
                              child: Center(
                                child: Icon(
                                  Remix.drinks_2_fill,
                                  color: ColorName.primaryLight,
                                  size: 24,
                                ),
                              ),
                            ),
                            // Spacer()
                          ],
                        )
                      ],
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'balance'.tr().capitalize(),
                            style: AppTextStyle.bodyS(color: ColorName.white),
                          ),
                          Text('${formatCurrency(((pig?.balance ?? 0)))}đ',
                              style: AppTextStyle.headingS(
                                color: ColorName.white,
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
    });
  }
}
