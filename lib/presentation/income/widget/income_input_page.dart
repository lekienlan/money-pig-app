import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/income/provider/amount_input_provider.dart';
import 'package:money_pig/presentation/income/provider/income_provider.dart';
import 'package:money_pig/router/app_router.dart';

import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/currency_input_formatter.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';

class IncomeInputPage extends ConsumerStatefulWidget {
  const IncomeInputPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IncomeInputPageState();
}

class _IncomeInputPageState extends ConsumerState<IncomeInputPage> {
  TextEditingController amountController = TextEditingController();

  @override
  void didChangeDependencies() {
    final amountInputNotifier = ref.watch(amountInputNotifierProvider);
    amountController.text = isTruthy(amountInputNotifier.amount)
        ? formatCurrency(amountInputNotifier.amount)
        : '';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final amountInputNotifier = ref.watch(amountInputNotifierProvider);
    return Scaffold(
        appBar: HeaderWidget(
          title: 'income'.tr().capitalize(),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 32),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    maxLines: null,
                    autofocus: true,
                    inputFormatters: [CurrencyInputFormatter()],
                    onChanged: (value) {
                      setState(() {});
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
            ElevatedButton(
                onPressed: () async {
                  ref.invalidate(amountInputNotifierProvider);
                  await ref
                      .read(incomeNotifierProvider.notifier)
                      .handleAddIncome(amountInputNotifier.amount);
                  ref.read(routerProvider).pop();
                },
                child: Text('create'))
          ],
        ));
  }
}
