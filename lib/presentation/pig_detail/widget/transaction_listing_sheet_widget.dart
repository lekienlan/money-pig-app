import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_calendar_provider.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_listing_provider.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_row_widget.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';

class TransactionListingSheet extends ConsumerWidget {
  final PigModel? pig;
  final ScrollController? listController;
  final DraggableScrollableController? sheetController;

  const TransactionListingSheet({
    super.key,
    this.pig,
    this.sheetController,
    this.listController,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate =
        ref.watch(pigDetailCalendarNotifierProvider).selectedDate;

    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: 0.32,
      snap: true,
      // snapSizes: [0.32, 0.86],
      minChildSize: 0.32,
      maxChildSize: 0.86,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [AppShadow.withSpreadRadius(4)],
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                child: Container(
                  height: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 148,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColor.textDisabled,
                        ),
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  controller: listController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: AppColor.white,
                      leadingWidth: 0,
                      scrolledUnderElevation: 0,
                      floating: true,
                      leading: SizedBox(),
                      toolbarHeight: 48,
                      centerTitle: true,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.zero,
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'balance'.tr().capitalize(),
                              style: AppTextStyle.bodyS(
                                color: AppColor.textTertiary,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              formatCurrency(
                                  (pig?.budget ?? 0) - (pig?.expense ?? 0)),
                              style: AppTextStyle.headingS(
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ...ref
                        .watch(transactionListingNotifierProvider(
                          TransactionParams(
                            period_id: pig?.period_id,
                            types: [
                              TransactionTypeEnum.expense,
                              TransactionTypeEnum.budget,
                            ],
                          ),
                        ))
                        .maybeWhen(
                          data: (data) {
                            final groupedTransactions =
                                _groupTransactionsByDate(data);
                            List<Widget> slivers = [];
                            groupedTransactions.forEach((date, transactions) {
                              slivers.add(_buildSliverGroupHeader(date));
                              slivers.add(_buildSliverGroupItems(transactions));
                            });

                            slivers.add(SliverToBoxAdapter(
                              child: SizedBox(
                                height: 64,
                              ),
                            ));

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _scrollToSelectedDate(
                                  selectedDate, slivers, listController);
                            });
                            return slivers;
                          },
                          orElse: () => [SliverToBoxAdapter()],
                        ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Map<DateTime, List<TransactionModel>> _groupTransactionsByDate(
      List<TransactionModel> transactions) {
    Map<DateTime, List<TransactionModel>> groupedTransactions = {};
    for (var transaction in transactions) {
      final transactionDate = isTruthy(transaction.created_at)
          ? DateTime.parse(transaction.created_at!)
          : DateTime.now();
      final date = DateTime(
        transactionDate.year,
        transactionDate.month,
        transactionDate.day,
      );
      if (groupedTransactions[date] == null) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }
    return groupedTransactions;
  }

  Widget _buildSliverGroupHeader(DateTime date) {
    return SliverPersistentHeader(
      delegate: _SliverHeaderDelegate(
        minHeight: 32,
        maxHeight: 32,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          color: AppColor.surfacePrimary,
          alignment: Alignment.bottomLeft,
          child: Text(
            date.toIso8601String().toDate(),
            style: AppTextStyle.heading2XS(color: AppColor.textTertiary),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverGroupItems(List<TransactionModel> transactions) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return TransactionRowWidget(
            transaction: transactions[index],
          );
        },
        childCount: transactions.length,
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

void _scrollToSelectedDate(DateTime? selectedDate, List<Widget> slivers,
    ScrollController? controller) {
  double offset = 0;
  const double kListItemHeight = 64;
  const double kHeaderHeight = 32;
  const double kAppBarHeight = 48;

  if (!isTruthy(selectedDate)) {
    controller!.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    return;
  }

  for (int i = 0; i < slivers.length; i++) {
    if (slivers[i] is SliverPersistentHeader) {
      _SliverHeaderDelegate delegate = (slivers[i] as SliverPersistentHeader)
          .delegate as _SliverHeaderDelegate;

      // Check if the delegate is the header we want to scroll to
      if (delegate.child is Container &&
          (delegate.child as Container).child is Text) {
        Text headerText = ((delegate.child as Container).child) as Text;
        DateTime headerDate =
            DateFormat('dd MMMM, yyyy').parse(headerText.data!);

        // Compare dates to determine if this is the header for selectedDate
        if (isSameDay(selectedDate, headerDate)) {
          // Scroll to the calculated offset
          controller!.animateTo(
            offset + kAppBarHeight,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          break;
        }
      }
    }

    // Calculate the offset based on the height of each sliver
    if (slivers[i] is SliverList) {
      // Approximate the height of the SliverList by assuming each item has a constant height
      final delegate = (slivers[i] as SliverList).delegate;

      offset +=
          (delegate.estimatedChildCount! * kListItemHeight) + kHeaderHeight;
    }
  }
}
