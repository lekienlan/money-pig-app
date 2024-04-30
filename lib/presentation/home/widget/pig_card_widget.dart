import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_pig/domain/model/pig.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/helper.dart';

class PigCardWidget extends StatelessWidget {
  final Pig? pig;
  final GlobalKey _key = GlobalKey();
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
            color: ColorName.pink100,
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
                  color: ColorName.pink400,
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
                          child: Text('${pig?.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorName.pink700,
                                fontSize: dynamicFontSize(
                                  text: pig?.name ?? '',
                                  defaultFontSize: 20,
                                  stepLength: 6,
                                ),
                              )),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: ColorName.pink500.withOpacity(0.8),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.card_membership_sharp,
                                  color: ColorName.white,
                                  size: 20,
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
                            'Số dư',
                            style: AppTextStyle.bodyS(color: ColorName.white),
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text:
                                    '${formatCurrency(((pig?.balance ?? 0) / 1000))}.',
                                style: TextStyle(
                                  fontSize: dynamicFontSize(
                                      text: pig?.balance?.toString() ?? '',
                                      stepLength: 7,
                                      scale: 0.8,
                                      defaultFontSize: 28),
                                  shadows: [
                                    AppShadow.light,
                                  ],
                                ),
                              ),
                              TextSpan(
                                  text: '000 đ',
                                  style: AppTextStyle.heading2XS()
                                      .copyWith(shadows: [AppShadow.light])),
                            ]),
                            style:
                                AppTextStyle.headingL(color: ColorName.white),
                          ),
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
