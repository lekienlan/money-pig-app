import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/presentation/home/widget/pig_card_widget.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_provider.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_listing_provider.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_icon_widget.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_row_widget.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:remixicon/remixicon.dart';

class PigDetailPage extends ConsumerStatefulWidget {
  final String? id;
  const PigDetailPage({this.id, super.key});

  @override
  PigDetailPageState createState() => PigDetailPageState();
}

class PigDetailPageState extends ConsumerState<PigDetailPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pigDetailNotifier =
        ref.watch(pigDetailNotifierProvider(widget.id ?? ''));

    return Hero(
      tag: "pig-${widget.id}",
      child: Scaffold(
          appBar: HeaderWidget(
            background: Colors.transparent,
          ),
          body: pigDetailNotifier.maybeWhen(
              orElse: () => SizedBox(),
              data: (pig) => Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pig.name ?? '',
                                  style: AppTextStyle.headingM(
                                    color: ColorName.textPrimary,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${pig.start_date?.toDate(format: 'dd MMMM') ?? ''} => ${pig.end_date?.toDate(format: 'dd MMMM') ?? ''}',
                                  style: AppTextStyle.heading2XS(),
                                )
                              ],
                            ),
                            PigCardIcon()
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorName.surfaceSecondary,
                                      ColorName.primaryExtraLight
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Column(children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => ref
                                              .read(routerProvider)
                                              .push(TransactionInputRoute(
                                                type:
                                                    TransactionTypeEnum.budget,
                                                periodId: pig.period_id,
                                              ).location),
                                          child: _BudgetExpenseCard(
                                            title: 'budget',
                                            amount: pig.budget,
                                            color: ColorName.green500,
                                            icon: Remix.arrow_down_line,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => ref
                                              .read(routerProvider)
                                              .push(TransactionInputRoute(
                                                type:
                                                    TransactionTypeEnum.expense,
                                                periodId: pig.period_id,
                                              ).location),
                                          child: _BudgetExpenseCard(
                                            title: 'expense',
                                            amount: pig.expense,
                                            color: ColorName.orange500,
                                            icon: Remix.arrow_up_line,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ])),
                            _TransactionListingSheet(
                              ref: ref,
                              pig: pig,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
    );
  }
}

class _TransactionListingSheet extends StatelessWidget {
  final PigModel? pig;
  const _TransactionListingSheet({
    super.key,
    this.pig,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      snap: true,
      snapSizes: [0.6, 1],
      minChildSize: 0.2,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: ColorName.white,
            boxShadow: [AppShadow.withSpreadRadius(1)],
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 148,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ColorName.textDisabled),
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: ColorName.white,
                      leadingWidth: 0,
                      scrolledUnderElevation: 0,
                      floating: true,
                      leading: SizedBox(),
                      centerTitle: true,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.zero,
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'balance'.tr().capitalize(),
                              style: AppTextStyle.bodyS(
                                  color: ColorName.textTertiary),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              formatCurrency(
                                  (pig?.budget ?? 0) - (pig?.expense ?? 0)),
                              style: AppTextStyle.headingM(
                                  color: ColorName.textSecondary),
                            )
                          ],
                        ),
                      ),
                    ),
                    ref
                        .watch(transactionListingNotifierProvider(
                            TransactionParams(
                          period_id: pig?.period_id,
                          types: [
                            TransactionTypeEnum.expense,
                            TransactionTypeEnum.budget,
                          ],
                        )))
                        .maybeWhen(
                            data: (data) {
                              return SliverList.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return TransactionRowWidget(
                                      transaction: data[index],
                                    );
                                  });
                            },
                            orElse: () => SliverToBoxAdapter())
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BudgetExpenseCard extends StatelessWidget {
  final String title;
  final num? amount;
  final Color color;
  final IconData icon;

  _BudgetExpenseCard({
    required this.title,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadow.light],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.tr().capitalize(),
                style: AppTextStyle.bodyS(
                  color: ColorName.textTertiary,
                ),
              ),
              TransactionIconWidget(
                iconColor: color,
                icon: icon,
                rotation: 0.75,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            formatCurrency(amount),
            style: AppTextStyle.headingXS(color: color),
          ),
        ],
      ),
    );
  }
}
