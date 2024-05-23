import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/income/provider/amount_input_provider.dart';
import 'package:money_pig/presentation/income/provider/income_provider.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';

import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/currency_input_formatter.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:money_pig/shared/widget/num_pad_widget.dart';

class IncomeInputPage extends ConsumerStatefulWidget {
  const IncomeInputPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IncomeInputPageState();
}

class _IncomeInputPageState extends ConsumerState<IncomeInputPage> {
  TextEditingController amountController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool isNoteFocused = false;

  @override
  void didChangeDependencies() {
    final amountInputNotifier = ref.watch(amountInputNotifierProvider);
    amountController.text = isTruthy(amountInputNotifier.amount)
        ? formatCurrency(amountInputNotifier.amount)
        : '';
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isNoteFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final amountInputNotifier = ref.watch(amountInputNotifierProvider);
    log("${MediaQuery.of(context).size.height}");
    return Scaffold(
        appBar: HeaderWidget(
          title: 'income'.tr().capitalize(),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      TextField(
                        showCursor: true,
                        readOnly: true,
                        controller: amountController,
                        keyboardType: TextInputType.none,
                        maxLines: null,
                        autofocus: true,
                        inputFormatters: [CurrencyInputFormatter()],
                        onChanged: (value) {
                          ref
                              .read(amountInputNotifierProvider.notifier)
                              .onChangeAmount(amountController.text);
                        },
                        cursorColor: ColorName.textPrimary,
                        style: TextStyle(
                            color: ColorName.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicFontSize(
                                text: amountController.text,
                                stepLength: 10,
                                scale: 0.8,
                                defaultFontSize: 52)),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '...'),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 80,
                // ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                padding: EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ghi chú', style: AppTextStyle.bodyS()),
                    TextField(
                      focusNode: _focusNode,
                    ),
                  ],
                ),
              ),
            ),
            if (!isNoteFocused)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth,
                    child: SafeArea(
                      child: NumPadWidget(
                          value: amountInputNotifier.amount,
                          onChange: (v) {
                            ref
                                .read(amountInputNotifierProvider.notifier)
                                .onChangeAmount(v);
                            log("$v");
                            amountController.text = isTruthy(v)
                                ? "${formatCurrency(num.parse(v!))}đ"
                                : '';
                          },
                          onComplete: () async {
                            ref.invalidate(amountInputNotifierProvider);
                            await ref
                                .read(incomeNotifierProvider.notifier)
                                .handleAddIncome(amountInputNotifier.amount);
                            ref.read(routerProvider).pop();
                          }),
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
