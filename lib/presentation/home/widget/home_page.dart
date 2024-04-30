import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/home/provider/pig_listing_provider.dart';
import 'package:money_pig/presentation/home/widget/pig_card_widget.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/assets.gen.dart';

import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pigListingNotifier = ref.watch(pigListingNotifierProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            toolbarHeight: 0,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                _UserIncome(ref),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                    child: pigListingNotifier.maybeWhen(
                  data: (pigListing) {
                    return GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: pigListing
                          .map((pig) => PigCardWidget(
                                pig: pig,
                              ))
                          .toList(),
                    );
                  },
                  orElse: () => Text('loading books'),
                )),
                SizedBox(
                  height: 12,
                ),
                _NewPig(ref)
              ],
            ),
          )),
    );
  }

  Widget _UserIncome(WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [AppShadow.normal],
        borderRadius: BorderRadius.circular(16),
        color: ColorName.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('income'.tr().capitalize(), style: AppTextStyle.bodyS()),
              SizedBox(height: 4),
              Text(
                '${formatCurrency(100000)}đ',
                style: AppTextStyle.headingM(color: ColorName.textPrimary),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 24,
              decoration: BoxDecoration(
                  color: ColorName.primaryMain,
                  borderRadius: BorderRadius.circular(100)),
              height: 24,
              child: Icon(
                Icons.add,
                color: ColorName.white,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _NewPig(WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(routerProvider).go(NewPigRoute.path),
      child: Column(
        children: [
          Assets.images.pigNosePng.image(width: 32),
          SizedBox(height: 4),
          Text(
            'Heo mới',
            style: AppTextStyle.headingXS(color: ColorName.primaryMain),
          )
        ],
      ),
    );
  }
}
