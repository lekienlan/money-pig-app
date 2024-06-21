import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_calendar_provider.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PigDetailCalendarWidget extends ConsumerWidget {
  final PigModel? pig;
  const PigDetailCalendarWidget({super.key, this.pig});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarNotifier =
        ref.read(pigDetailCalendarNotifierProvider.notifier);
    final calendarProvider = ref.watch(pigDetailCalendarNotifierProvider);

    return Container(
        decoration: BoxDecoration(boxShadow: [AppShadow.hard]),
        height: 320,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SfCalendar(
            onTap: (details) {
              // Clear selectedDate if it's the same as the newly selected date
              if (isSameDay(details.date, calendarProvider.selectedDate)) {
                calendarNotifier.onSelectDate(null);
                return;
              }

              calendarNotifier.onSelectDate(details.date);
            },
            onViewChanged: (ViewChangedDetails details) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (details.visibleDates.isNotEmpty) {
                  final firstVisibleDate = details.visibleDates.first;
                  ref
                      .read(pigDetailCalendarNotifierProvider.notifier)
                      .onChangeVisibleMonth(firstVisibleDate);
                }
              });
            },
            selectionDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColor.surfacePrimary,
            view: CalendarView.month,
            viewHeaderHeight: 32,
            viewHeaderStyle: ViewHeaderStyle(
                backgroundColor: AppColor.surfaceSecondary,
                dayTextStyle:
                    AppTextStyle.bodyS(color: AppColor.textSecondary)),
            headerStyle: CalendarHeaderStyle(
                backgroundColor: AppColor.surfacePrimary,
                textStyle: AppTextStyle.headingXS()),
            firstDayOfWeek: 1,
            monthViewSettings: MonthViewSettings(
              showAgenda: false,
              // numberOfWeeksInView: 4,
            ),
            monthCellBuilder: (BuildContext context, MonthCellDetails details) {
              bool _isToday = isToday(details.date);

              // Get the month of the currently displayed calendar
              int _currentMonth = DateTime.now().month;
              bool _isInCurrentMonth = details.date.month == _currentMonth;
              bool _isSelected =
                  isSameDay(details.date, calendarProvider.selectedDate);

              return Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: _isSelected
                        ? AppColor.textTertiary
                        : Colors.transparent,
                  ),
                ),
                child: Column(
                  children: [
                    Text(details.date.day.toString(),
                        style: _isToday
                            ? AppTextStyle.heading2XS(
                                color: AppColor.primaryMain)
                            : AppTextStyle.bodyS(
                                color: _isSelected || _isInCurrentMonth
                                    ? AppColor
                                        .textTertiary // Style for dates from current month
                                    : AppColor.textDisabled,
                              )),
                    FutureBuilder<List<int?>>(
                      future: calendarNotifier.getTransactionAmountsForDate(
                        periodId: pig?.period_id ?? '',
                        date: details.date.toIso8601String(),
                      ),
                      builder: (context, snapshot) {
                        int? _cellBudgetAmount = snapshot.data?[0];
                        int? _cellExpenseAmount = snapshot.data?[1];

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isTruthy(_cellBudgetAmount))
                              _TransactionAmount(
                                amount: _cellBudgetAmount,
                                color: AppColor.green500,
                              ),
                            if (isTruthy(_cellExpenseAmount))
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  _TransactionAmount(
                                    amount: _cellExpenseAmount,
                                    color: AppColor.orange500,
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              );

              // Clear the cache when new data is received
              // calendarNotifier.clearCache();
            },
          ),
        ));
  }
}

class _TransactionAmount extends StatelessWidget {
  final Color? color;
  final num? amount;
  const _TransactionAmount({super.key, this.color, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 4,
      // height: 4,
      decoration: BoxDecoration(
        // color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        formatNumberWithSuffix(amount),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 7, color: color),
      ),
    );
  }
}
