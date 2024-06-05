import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/presentation/category_listing/provider/category_listing_provider.dart';
import 'package:money_pig/presentation/category_listing/widget/category_item_widget.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_input_provider.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/currency_input_formatter.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:money_pig/shared/widget/num_pad_widget.dart';
import 'package:remixicon/remixicon.dart';

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
    final categoryListingNotifier = ref.watch(
        categoryListingNotifierProvider(CategoryParams(types: [widget.type])));

    _genColor() {
      if (widget.type == TransactionTypeEnum.budget ||
          widget.type == TransactionTypeEnum.income) return ColorName.green500;
      if (widget.type == TransactionTypeEnum.expense)
        return ColorName.orange500;
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
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(
                              Remix.edit_2_line,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                cursorHeight: 24,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nhập ghi chú...'),
                                focusNode: _focusNode,
                                onChanged: (value) {
                                  String text = sanitizeText(value);

                                  notifier.onChangeNote(text);
                                  noteController.text = text;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      categoryListingNotifier.maybeWhen(
                        orElse: () => SizedBox(),
                        data: (categoryListing) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            // This will be executed after the build is complete
                            if (categoryListing.isNotEmpty &&
                                transactionInputNotifier.selectedCategory ==
                                    null) {
                              notifier.onSelectCategory(categoryListing.first);
                            }
                          });
                          return Container(
                            height: 40,
                            child: CustomScrollView(
                                scrollDirection: Axis.horizontal,
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: SizedBox(width: 16),
                                  ),
                                  SliverList.builder(
                                      itemCount: categoryListing.length,
                                      itemBuilder: (context, index) {
                                        final category = categoryListing[index];

                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: CategoryItemWidget(
                                            onTap: () {
                                              notifier
                                                  .onSelectCategory(category);
                                            },
                                            isSelected: category ==
                                                transactionInputNotifier
                                                    .selectedCategory,
                                            category: category,
                                          ),
                                        );
                                      }),
                                  if (widget.type != TransactionTypeEnum.budget)
                                    SliverToBoxAdapter(
                                        child: GestureDetector(
                                      onTap: () {
                                        // Define your onPressed action here
                                        ref.read(routerProvider).push(
                                            CategoryInputRoute(
                                                    type: widget.type)
                                                .location);
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: ColorName
                                              .white, // background color
                                          shape: BoxShape
                                              .circle, // makes the container circular
                                        ), // padding inside the container
                                        child: Icon(
                                          Remix.add_fill,
                                          color: _genColor(), // icon color
                                        ),
                                      ),
                                    )),
                                  SliverToBoxAdapter(
                                    child: SizedBox(width: 16),
                                  ),
                                ]),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: !isNoteFocused ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500), // A
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      child: SafeArea(
                        child: Container(
                          color: ColorName.surfaceSecondary,
                          child: !isNoteFocused
                              ? NumPadWidget(
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
                                    await notifier.onComplete(TransactionModel(
                                      amount: transactionInputNotifier.amount,
                                      period_id: widget.periodId,
                                      note: transactionInputNotifier.note,
                                      category_id: transactionInputNotifier
                                          .selectedCategory?.id,
                                    ));
                                    ref.invalidate(
                                        transactionInputNotifierProvider);
                                    ref.read(routerProvider).pop();
                                  })
                              : null,
                        ),
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
