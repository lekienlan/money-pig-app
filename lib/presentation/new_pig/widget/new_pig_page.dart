import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/new_pig/provider/new_pig_provider.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/currency_input_formatter.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/date_range_picker_widget.dart';
import 'package:money_pig/shared/widget/header_widget.dart';

class NewPigPage extends ConsumerStatefulWidget {
  final String? id;
  const NewPigPage({this.id, super.key});

  @override
  NewPigPageState createState() => NewPigPageState();
}

class NewPigPageState extends ConsumerState<NewPigPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  PageController _pageViewController = PageController();
  int selectedPageIndex = 0;

  DateTime selectedDate = DateTime.now();

  @override
  void didChangeDependencies() {
    final newPigNotifier = ref.watch(newPigNotifierProvider);
    super.didChangeDependencies();
    nameController.text = newPigNotifier.name ?? '';
    budgetController.text = isTruthy(newPigNotifier.budget)
        ? '${formatCurrency(newPigNotifier.budget)}đ'
        : '';
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    _pageViewController.dispose();
  }

  String renderTitle(int index) {
    if (index == 0) return 'pig_name'.tr();
    if (index == 1) return 'budget'.tr();
    if (index == 2) return 'time_range'.tr();
    return 'complete'.tr();
  }

  Widget build(BuildContext context) {
    final newPigNotifier = ref.watch(newPigNotifierProvider);

    Widget _newPigName() {
      return TextField(
        controller: nameController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        autofocus: true,
        onChanged: (value) {
          setState(() {});
          ref
              .read(newPigNotifierProvider.notifier)
              .onChangeName(nameController.text);
        },
        cursorColor: ColorName.textPrimary,
        style: TextStyle(
            color: ColorName.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: dynamicFontSize(
                text: nameController.text,
                stepLength: 5,
                scale: 0.9,
                defaultFontSize: 64)),
        decoration: InputDecoration(border: InputBorder.none, hintText: '...'),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      );
    }

    Widget _newPigBudget() {
      return TextField(
        controller: budgetController,
        keyboardType: TextInputType.number,
        maxLines: null,
        autofocus: true,
        inputFormatters: [CurrencyInputFormatter()],
        onChanged: (value) {
          setState(() {});
          ref
              .read(newPigNotifierProvider.notifier)
              .onChangeBudget(budgetController.text);
        },
        cursorColor: ColorName.textPrimary,
        style: TextStyle(
            color: ColorName.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: dynamicFontSize(
                text: budgetController.text,
                stepLength: 10,
                scale: 0.8,
                defaultFontSize: 52)),
        decoration: InputDecoration(border: InputBorder.none, hintText: '...'),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      );
    }

    Widget _newPigTimeRange() {
      return Column(
        children: [
          DateRangePickerWidget(
            startDate: newPigNotifier.startDate,
            endDate: newPigNotifier.endDate,
            onChange: ({startDate, endDate}) {
              ref
                  .read(newPigNotifierProvider.notifier)
                  .onChangeTimeRange(startDate: startDate, endDate: endDate);
            },
          ),
        ],
      );
    }

    Widget _newPigComplete() {
      return Column(
        children: [
          Text(newPigNotifier.name ?? ''),
          Text(newPigNotifier.budget.toString()),
          Text(newPigNotifier.startDate ?? ''),
          Text(newPigNotifier.endDate ?? ''),
        ],
      );
    }

    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: HeaderWidget(
        title: 'new_pig'.tr().capitalize(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                        );
                      },
                      duration: Duration(milliseconds: 200),
                      child: Column(
                        key: ValueKey<int>(selectedPageIndex),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(renderTitle(selectedPageIndex).capitalize(),
                              style: AppTextStyle.headingXL().copyWith()),
                          if (selectedPageIndex < 3)
                            Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '${'next'.tr().capitalize()}: '),
                                    TextSpan(
                                        text: renderTitle(selectedPageIndex + 1)
                                            .capitalize(),
                                        style: AppTextStyle.headingXS(
                                            color: ColorName.textBorder))
                                  ],
                                  style: AppTextStyle.bodyM(
                                      color: ColorName.textBorder)),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorName.primaryMain,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Flexible(
              child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      _pageViewController.animateToPage(index,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.linear);
                      selectedPageIndex = index;
                    });
                  },
                  controller: _pageViewController,
                  children: [
                    _newPigName(),
                    _newPigBudget(),
                    _newPigTimeRange(),
                    _newPigComplete()
                  ]),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _pageViewController.animateToPage(selectedPageIndex + 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  });
                },
                child: Text(
                  'next'.tr().capitalize(),
                )),
            if (selectedPageIndex > 0)
              SafeArea(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        _pageViewController.animateToPage(selectedPageIndex - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      });
                    },
                    child: Text(
                      'back'.tr().capitalize(),
                    )),
              ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
