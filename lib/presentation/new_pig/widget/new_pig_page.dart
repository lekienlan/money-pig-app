import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/home/widget/pig_card_widget.dart';
import 'package:money_pig/presentation/new_pig/provider/new_pig_provider.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/currency_input_formatter.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/date_range_picker_widget.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:remixicon/remixicon.dart';

class NewPigPage extends ConsumerStatefulWidget {
  const NewPigPage({super.key});

  @override
  NewPigPageState createState() => NewPigPageState();
}

class NewPigPageState extends ConsumerState<NewPigPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  PageController _pageViewController = PageController();
  int selectedPageIndex = 0;
  bool isSubmitting = false;

  @override
  void didChangeDependencies() {
    final newPigNotifier = ref.watch(newPigNotifierProvider);
    super.didChangeDependencies();
    nameController.text = newPigNotifier.name ?? '';
    budgetController.text = isTruthy(newPigNotifier.budget)
        ? formatCurrency(newPigNotifier.budget)
        : '';
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    _pageViewController.dispose();
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
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              width: 4, // Thickness of the line
              height: double.infinity,
              color: ColorName.primaryUltraLight, // Color of the line
            ),
          ),
          Column(
            children: [
              PigCardIcon(),
              SizedBox(height: 32),
              Container(
                color: ColorName.white,
                child: Column(
                  children: [
                    Text(
                      newPigNotifier.name ?? '',
                      textAlign: TextAlign.center,
                      style:
                          AppTextStyle.heading2XL(color: ColorName.textPrimary)
                              .copyWith(
                                  fontSize: dynamicFontSize(
                                      text: nameController.text,
                                      stepLength: 5,
                                      scale: 0.9,
                                      defaultFontSize: 64)),
                    ),
                    Text(formatCurrency(newPigNotifier.budget),
                        style: AppTextStyle.headingXL()),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                color: ColorName.white,
                padding: EdgeInsets.all(4),
                child: Column(
                  children: [
                    Text('${'from'.tr().capitalize()} ${'start_of_day'.tr()}',
                        style: AppTextStyle.bodyS(color: ColorName.textBorder)),
                    Text((newPigNotifier.startDate ?? '').toDate(),
                        style: AppTextStyle.headingS()),
                    SizedBox(height: 16),
                    Text('${'to'.tr().capitalize()} ${'start_of_day'.tr()}',
                        style: AppTextStyle.bodyS(color: ColorName.textBorder)),
                    Text((newPigNotifier.endDate ?? '').toDate(),
                        style: AppTextStyle.headingS())
                  ],
                ),
              )
            ],
          )
        ],
      );
    }

    List<Widget> pageList = [
      _newPigName(),
      _newPigBudget(),
      _newPigTimeRange(),
      _newPigComplete()
    ];

    Widget _actionButton() {
      return Column(
        children: [
          if (selectedPageIndex == pageList.length - 1)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(newPigNotifierProvider.notifier).handleSubmit();
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                            width: 100,
                            height: 100,
                            child: TweenAnimationBuilder<double>(
                              duration: Duration(milliseconds: 500),
                              tween: Tween(
                                  begin: 0,
                                  end: newPigNotifier.isSubmitting ?? false
                                      ? 1
                                      : 0),
                              builder: (context, value, _) =>
                                  CircularProgressIndicator(
                                value: value,
                                strokeWidth: 24,
                                backgroundColor: ColorName.primaryUltraLight,
                              ),
                            )),
                      ),
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Remix.add_fill,
                                  size: 40,
                                  color: ColorName.primaryMain,
                                )
                                // Assets.images.pigNosePng.image(width: 32),
                                // Text(
                                //   '${'create'.tr().capitalize()}',
                                //   textAlign: TextAlign.center,
                                //   style: AppTextStyle.headingS(
                                //       color: ColorName.primaryMain),
                                // ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [AppShadow.normal],
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
              ],
            )
          else
            ElevatedButton(
                onPressed: ref
                        .read(newPigNotifierProvider.notifier)
                        .isEnabled(selectedPageIndex)
                    ? () {
                        setState(() {
                          _pageViewController.animateToPage(
                              selectedPageIndex + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        });
                      }
                    : null,
                child: Text(
                  'next'.tr().capitalize(),
                )),
          if (selectedPageIndex > 0)
            Column(
              children: [
                SizedBox(height: 4),
                SafeArea(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: ColorName.textTertiary),
                      onPressed: () {
                        setState(() {
                          _pageViewController.animateToPage(
                              selectedPageIndex - 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Text(
                        'back'.tr().capitalize(),
                      )),
                ),
              ],
            ),
          SizedBox(height: 8),
        ],
      );
    }

    Widget _stepper() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        ref
                            .read(newPigNotifierProvider.notifier)
                            .renderTitle(selectedPageIndex)
                            .capitalize(),
                        style: AppTextStyle.headingL().copyWith()),
                    if (selectedPageIndex < pageList.length - 1)
                      Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(text: '${'next'.tr().capitalize()}: '),
                              TextSpan(
                                text: ref
                                    .read(newPigNotifierProvider.notifier)
                                    .renderTitle(selectedPageIndex + 1)
                                    .capitalize(),
                              )
                            ],
                            style: AppTextStyle.bodyS(
                                color: ColorName.textBorder)),
                      )
                  ],
                ),
              ),
            ),
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 200),
              tween: Tween(
                  begin: 0, end: (selectedPageIndex + 1) / pageList.length),
              builder: (context, value, _) => Stack(
                key: ValueKey(selectedPageIndex),
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 4,
                      backgroundColor: ColorName.primaryUltraLight,
                      color: ColorName.primaryLight,
                    ),
                  ),
                  Text(
                    '${(selectedPageIndex + 1).toString()}/${pageList.length.toString()}',
                    style: AppTextStyle.headingS(),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: HeaderWidget(
        title: 'new_pig'.tr().capitalize(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 12),
            _stepper(),
            SizedBox(height: 32),
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
                  children: pageList),
            ),
            _actionButton()
          ],
        ),
      ),
    );
  }
}
