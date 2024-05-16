import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:remixicon/remixicon.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePickerWidget extends StatefulWidget {
  final String? startDate;
  final String? endDate;
  final Function({String? startDate, String? endDate})? onChange;
  const DateRangePickerWidget(
      {super.key, this.startDate, this.endDate, this.onChange});

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  @override
  Widget build(BuildContext context) {
    showDatePicker() {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                insetPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                content: Builder(
                  builder: (context) {
                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;

                    return Container(
                      color: ColorName.blue100,
                      // height: height - 400,
                      width: width - 48,
                      height: height / 2,
                      child: Column(
                        children: [
                          Expanded(
                              child: SfDateRangePicker(
                            initialSelectedRange: PickerDateRange(
                                isTruthy(widget.startDate)
                                    ? DateTime.parse(widget.startDate ?? '')
                                    : null,
                                isTruthy(widget.endDate)
                                    ? DateTime.parse(widget.endDate ?? '')
                                    : null),
                            headerHeight: 48,
                            view: DateRangePickerView.month,
                            // showActionButtons: true,
                            selectionMode: DateRangePickerSelectionMode.range,
                            backgroundColor: ColorName.white,
                            headerStyle: DateRangePickerHeaderStyle(
                              backgroundColor: ColorName.surfacePrimary,
                              textStyle: AppTextStyle.headingXS(
                                  color: ColorName.textSecondary),
                            ),
                            monthCellStyle: DateRangePickerMonthCellStyle(
                              textStyle: AppTextStyle.bodyS(
                                  color: ColorName.textSecondary),
                              trailingDatesTextStyle: AppTextStyle.bodyS(
                                  color: ColorName.textBorder),
                              leadingDatesTextStyle: AppTextStyle.bodyS(
                                  color: ColorName.textBorder),
                            ),

                            monthViewSettings: DateRangePickerMonthViewSettings(
                                firstDayOfWeek: 1,
                                showTrailingAndLeadingDates: true,
                                viewHeaderHeight: 40,
                                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                                  backgroundColor: ColorName.surfaceSecondary,
                                  textStyle: AppTextStyle.heading2XS(),
                                )),
                            todayHighlightColor: ColorName.primaryMain,
                            selectionTextStyle:
                                AppTextStyle.heading2XS(color: ColorName.white),
                            rangeSelectionColor: ColorName.primaryUltraLight,
                            onSelectionChanged:
                                (DateRangePickerSelectionChangedArgs args) {
                              if (args.value is PickerDateRange) {
                                // final DateTime rangeStartDate =
                                // args.value.startDate;
                                // final DateTime rangeStartDate =
                                //     args.value.endDate;
                                widget.onChange?.call(
                                    startDate: args.value.startDate
                                            .toIso8601String() ??
                                        '',
                                    endDate:
                                        args.value.endDate?.toIso8601String() ??
                                            '');
                              }
                            },
                          ))
                        ],
                      ),
                    );
                  },
                ),
              ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${'from'.tr().capitalize()} ${'start_of_day'.tr()}',
            style: AppTextStyle.bodyM()),
        SizedBox(height: 4),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(width: 1, color: ColorName.textBorder),
              backgroundColor: ColorName.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
            onPressed: () {
              showDatePicker();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (widget.startDate ?? '').toDate(),
                  style: AppTextStyle.headingM(color: ColorName.textSecondary),
                ),
                Icon(
                  Remix.arrow_down_s_line,
                  color: ColorName.textSecondary,
                )
              ],
            )),
        SizedBox(height: 40),
        Text('${'to'.tr().capitalize()} ${'start_of_day'.tr()}',
            style: AppTextStyle.bodyM()),
        SizedBox(height: 4),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(width: 1, color: ColorName.textBorder),
              backgroundColor: ColorName.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
            onPressed: () {
              showDatePicker();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isTruthy(widget.endDate) ? widget.endDate!.toDate() : '...',
                  style: AppTextStyle.headingM(color: ColorName.textSecondary),
                ),
                Icon(
                  Remix.arrow_down_s_line,
                  color: ColorName.textSecondary,
                )
              ],
            )),
      ],
    );
  }
}
