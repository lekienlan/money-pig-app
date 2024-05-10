import 'dart:developer';

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
import 'package:money_pig/shared/widget/loading_widget.dart';
import 'package:money_pig/shared/widget/navigation_bar_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pigListingNotifier = ref.watch(pigListingNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorName.surfaceSecondary,
          scrolledUnderElevation: 0.0,
          toolbarHeight: 0,
        ),
        body: Stack(
          children: [
            CustomScrollView(
              // shrinkWrap: true,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: _UserIncome(ref),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                pigListingNotifier.when(
                  loading: () => SliverToBoxAdapter(child: LoadingWidget()),
                  empty: () => SliverToBoxAdapter(child: Text('empty')),
                  error: () => SliverToBoxAdapter(child: Text('error')),
                  data: (pigListing) {
                    return SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      sliver: SliverGrid.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          // Ensure index is within bounds
                          if (index < pigListing.length) {
                            return PigCardWidget(
                              pig: pigListing[index],
                            );
                          } else {
                            return null; // Return null if index is out of bounds
                          }
                        },
                        itemCount: pigListing.length,
                      ),
                    );
                  },
                ),
                SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0),
                      ColorName.surfaceSecondary
                    ],
                    stops: [0, 0.6],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  child: _NewPig(ref)),
            )
          ],
        ),
        bottomNavigationBar: NavigationBarWidget());
  }
}

class _UserIncome extends SliverPersistentHeaderDelegate {
  final WidgetRef ref;

  _UserIncome(this.ref);

  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isScrolled = shrinkOffset > 10;
    log(shrinkOffset.toString());
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: isScrolled ? 8 : 0),
      padding: EdgeInsets.symmetric(horizontal: isScrolled ? 12 : 16),
      decoration: BoxDecoration(
        boxShadow: [AppShadow.normal],
        borderRadius: BorderRadius.circular(isScrolled ? 100 : 16),
        color: ColorName.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isScrolled)
                Column(
                  children: [
                    Text('income'.tr().capitalize(),
                        style: AppTextStyle.bodyS()),
                    SizedBox(height: 4),
                  ],
                ),
              Text(
                '${formatCurrency(120000)}đ',
                style: AppTextStyle.headingM(color: ColorName.textPrimary),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              ref.read(routerProvider).push(NewPigRoute.path);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: ColorName.textSecondary,
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                '${'add'.tr()} ${'income'.tr()}'.capitalize(),
                style: AppTextStyle.heading2XS(color: ColorName.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _NewPig(WidgetRef ref) {
  return GestureDetector(
    onTap: () => ref.read(routerProvider).push('/new-pig'),
    child: Column(
      children: [
        Assets.images.pigNosePng.image(width: 32),
        SizedBox(height: 2),
        Text(
          'new_pig'.tr().capitalize(),
          style: AppTextStyle.headingXS(color: ColorName.primaryMain),
        )
      ],
    ),
  );
}
