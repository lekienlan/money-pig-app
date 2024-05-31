import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/presentation/category/provider/category_listing_provider.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_input_provider.dart';
import 'package:money_pig/presentation/transaction/provider/income_provider.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';

import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/constant.dart';
import 'package:money_pig/shared/util/currency_input_formatter.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:money_pig/shared/widget/num_pad_widget.dart';

class TransactionInputPage extends ConsumerStatefulWidget {
  final TransactionTypeEnum type;
  final String? periodId;
  const TransactionInputPage({super.key, required this.type, this.periodId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IncomeInputPageState();
}

class _IncomeInputPageState extends ConsumerState<TransactionInputPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool isNoteFocused = false;

  @override
  void didChangeDependencies() {
    final transactionInputNotifier =
        ref.watch(transactionInputNotifierProvider(type: widget.type));
    amountController.text = isTruthy(transactionInputNotifier.amount) &&
            transactionInputNotifier.type == widget.type
        ? formatCurrency(transactionInputNotifier.amount)
        : '';

    noteController.text = transactionInputNotifier.note ?? '';
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
    final transactionInputNotifier =
        ref.watch(transactionInputNotifierProvider(type: widget.type));
    final notifier =
        ref.read(transactionInputNotifierProvider(type: widget.type).notifier);
    final categoryListingNotifier = ref.watch(categoryListingNotifierProvider(
        CategoryParams(types: [TransactionTypeEnum.income])));

    _genColor() {
      if (widget.type == TransactionTypeEnum.budget) return ColorName.green500;
      if (widget.type == TransactionTypeEnum.expense)
        return ColorName.orange500;
      if (widget.type == TransactionTypeEnum.income)
        return ColorName.primaryMain;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: HeaderWidget(
            title: widget.type.stringValue.tr().capitalize(),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
                          onChanged: (value) {},
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

                  categoryListingNotifier.maybeWhen(
                    orElse: () => SizedBox(),
                    data: (categoryListing) {
                      return Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: categoryListing
                                  .map((e) => Text(e.name ?? ''))
                                  .toList() ??
                              [],
                        ),
                      );
                    },
                  )
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ghi chú', style: AppTextStyle.bodyS()),
                      TextField(
                        focusNode: _focusNode,
                        onChanged: (value) {
                          String text = sanitizeText(value);

                          notifier.onChangeNote(text);
                          noteController.text = text;
                        },
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
                        child: Container(
                          color: ColorName.surfaceSecondary,
                          child: NumPadWidget(
                              title: widget.type.stringValue,
                              color: _genColor(),
                              value: transactionInputNotifier.amount,
                              onChange: (v) {
                                notifier.onChangeAmount(v);
                                amountController.text = isTruthy(v)
                                    ? formatCurrency(num.parse(v!))
                                    : '';
                              },
                              onComplete: () async {
                                await notifier.onComplete(
                                  amount: transactionInputNotifier.amount,
                                  period_id: widget.periodId,
                                  note: transactionInputNotifier.note,
                                );
                                ref.invalidate(
                                    transactionInputNotifierProvider);
                                ref.read(routerProvider).pop();
                              }),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          )),
    );
  }
}
