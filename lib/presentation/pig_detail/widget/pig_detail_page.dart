import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/home/widget/pig_card_widget.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_provider.dart';
import 'package:money_pig/presentation/pig_detail/widget/budget_expense_button_widget.dart';
import 'package:money_pig/presentation/pig_detail/widget/pig_detail_calendar_widget.dart';
import 'package:money_pig/presentation/pig_detail/widget/transaction_listing_sheet_widget.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/icon_mapper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:remixicon/remixicon.dart';

class PigDetailPage extends ConsumerStatefulWidget {
  final String? id;
  const PigDetailPage({this.id, super.key});

  @override
  PigDetailPageState createState() => PigDetailPageState();
}

class PigDetailPageState extends ConsumerState<PigDetailPage> {
  final _scrollController = ScrollController();
  final _transactionListingSheetController = DraggableScrollableController();
  final _transactionListingController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset > 10) {
      _transactionListingSheetController.animateTo(
        0.32,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void _transactionListingScrollListener() {
    // Check if scroll is from user behavior
    if (_transactionListingController.position.userScrollDirection !=
            ScrollDirection.idle &&
        _transactionListingController.offset < 0) {
      _transactionListingSheetController.animateTo(
        0.32,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _transactionListingController
        .addListener(_transactionListingScrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _transactionListingController
        .removeListener(_transactionListingScrollListener);
    _scrollController.dispose();
    _transactionListingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pigDetailNotifier =
        ref.watch(pigDetailNotifierProvider(widget.id ?? ''));

    return Hero(
      tag: "pig-${widget.id}",
      child: Scaffold(
          appBar: HeaderWidget(
            background: AppColor.surfaceSecondary,
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
                                    color: AppColor.textPrimary,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${pig.start_date?.toDate(format: 'dd MMMM') ?? ''} → ${pig.end_date?.toDate(format: 'dd MMMM') ?? ''}',
                                  style: AppTextStyle.bodyS(),
                                )
                              ],
                            ),
                            PigCardIcon(
                              icon: IconMapper.iconList[pig.style?.icon],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: AppColor.surfaceSecondary,
                                ),
                                child: CustomScrollView(
                                  controller: _scrollController,
                                  slivers: [
                                    SliverPadding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      sliver: SliverToBoxAdapter(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () => ref
                                                    .read(routerProvider)
                                                    .push(TransactionInputRoute(
                                                      type: TransactionTypeEnum
                                                          .budget,
                                                      periodId: pig.period_id,
                                                    ).location),
                                                child:
                                                    BudgetExpenseButtonWidget(
                                                  title: 'budget',
                                                  amount: pig.budget,
                                                  color: AppColor.green500,
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
                                                      type: TransactionTypeEnum
                                                          .expense,
                                                      periodId: pig.period_id,
                                                    ).location),
                                                child:
                                                    BudgetExpenseButtonWidget(
                                                  title: 'expense',
                                                  amount: pig.expense,
                                                  color: AppColor.orange500,
                                                  icon: Remix.arrow_up_line,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: SizedBox(
                                        height: 16,
                                      ),
                                    ),
                                    SliverPadding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      sliver: SliverToBoxAdapter(
                                        child: PigDetailCalendarWidget(
                                          pig: pig,
                                        ),
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: SizedBox(
                                        height: 16,
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.32,
                                      ),
                                    ),
                                  ],
                                )),
                            TransactionListingSheet(
                                ref: ref,
                                pig: pig,
                                sheetController:
                                    _transactionListingSheetController,
                                listController: _transactionListingController),
                          ],
                        ),
                      ),
                    ],
                  ))),
    );
  }
}
